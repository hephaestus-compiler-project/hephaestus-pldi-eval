"""Get the history of reported bugs.
"""
import argparse
import os
import json
import re
import tempfile
from pathlib import Path
import subprocess as sp


NOT_FOUND = []

JAVA = [
    '18.ea.21-open',
    '18.ea.20-open',
    '18.ea.18-open',
    '18.ea.2.lm-open',
    '17-open',
    '17.ea.3.pma-open',
    '17.0.1-open',
    '16.0.2-open',
    '16.0.1-open',
    '11.0.12-open',
    '11.0.11-open',
    '11.0.10-open',
    '11.0.2-open',
]

KOTLIN = [
    '1.5.31',
    '1.5.30',
    '1.5.21',
    '1.5.10',
    '1.5.0',
    '1.4.31',
    '1.4.30',
    '1.4.21',
    '1.4.20',
    '1.4.10',
    '1.4.0',
    '1.3.72',
    '1.3.71',
    '1.3.70',
    '1.3.61',
    '1.3.60',
    '1.3.50',
    '1.3.41',
    '1.3.40',
    '1.3.31',
    '1.3.30',
    '1.3.21',
    '1.3.20',
    '1.3.11',
    '1.3.10',
    '1.3.0',
    '1.2.71',
    '1.2.70',
    '1.2.61',
    '1.2.60',
    '1.2.51',
    '1.2.50',
    '1.2.41',
    '1.2.40',
    '1.2.31',
    '1.2.30',
    '1.2.21',
    '1.2.20',
    '1.2.10',
    '1.2.0',
    '1.1.61',
    '1.1.60',
    '1.1.51',
    '1.1.50',
    '1.1.4-3',
    '1.1.4-2',
    '1.1.4',
    '1.1.3-2',
]

GROOVY = [
    '4.0.0-beta-1',
    '4.0.0-alpha-3',
    '4.0.0-alpha-2',
    '4.0.0-alpha-1',
    '3.0.9',
    '3.0.8',
    '3.0.7',
    '3.0.6',
    '3.0.5',
    '3.0.4',
    '3.0.3',
    '3.0.2',
    '3.0.1',
    '3.0.0',
]

GROOVY_JAVA='11.0.2-open'

WHITELIST_VERSIONS = []
BLACKLIST_VERSIONS = []

VERSION = {
    'groovyc': GROOVY,
    'kotlinc': KOTLIN,
    'javac': JAVA
}

EXTENSIONS = {
    'groovyc': 'groovy',
    'kotlinc': 'kt',
    'javac': 'java'
}

LANG = {
    'groovyc': 'groovy',
    'kotlinc': 'kotlin',
    'javac': 'java'
}

UCTE_REGEX = {
    'groovyc': re.compile(r'([a-zA-Z0-9\\/_]+.groovy):([\s\S]*?(?=\n{2,}))'),
    'kotlinc': re.compile(r'([a-zA-Z0-9\/_]+.kt):\d+:\d+:[ ]+error:[ ]+(.*)'),
    'javac': re.compile(r'([a-zA-Z0-9\/_]+.java):(\d+:[ ]+error:[ ]+.*)(.*?(?=\n{1,}))')
}

SYMPTOMS = {
    'crash': 2,  # return code of crash
    'Unexpected Compile-Time Error': 1,  # return code of compiler error
    'Unexpected Runtime Behavior': 0  # return code when compile successfully
}

HOME = Path.home()
COMPILERS = {
    'groovyc': os.path.join(HOME, '.sdkman/candidates/groovy'),
    'kotlinc': os.path.join(HOME, '.sdkman/candidates/kotlin'),
    'javac': os.path.join(HOME, '.sdkman/candidates/java'),
}


def get_compiler(compiler, version):
    return os.path.join(COMPILERS[compiler], version, 'bin', compiler)


def check(bugid, compiler, versions, error, program, db):
    def get_name():
        if compiler == 'kotlinc':
            return 'program'
        else:
            for line in program:
                if 'class' in line:
                    minus_cls = line[line.find('class')+6:]
                    start = re.search(r'\W+', minus_cls)
                    if start:
                        return minus_cls[:start.start()]
                    return minus_cls
        return ''

    def check_version():
        if version in WHITELIST_VERSIONS:
            return True
        if version in BLACKLIST_VERSIONS:
            return False
        command = "{source}; {select}; {compile}".format(
            source='source ~/.sdkman/bin/sdkman-init.sh',
            select=f'sdk use {LANG[compiler]} {version} > /dev/null',
            compile=f'{compiler} -version'
        )
        args = ['bash', '-c', command]
        cmd = sp.Popen(args, stdout=sp.PIPE, stderr=sp.STDOUT)
        stdout, _ = cmd.communicate()
        for s in stdout.decode("utf-8").split('\n'):
            if 'exception' in s:
                BLACKLIST_VERSIONS.append(version)
                return False
        WHITELIST_VERSIONS.append(version)
        return True

    def check_oracle():
        """True means bug, False means not a bug
        """
        # Check URB
        if status == 0:
            return error == 'Unexpected Runtime Behavior'
        # We cannot check status because groovy returns 1 to crashes.
        # Check UCTE
        if re.search(UCTE_REGEX[compiler], stdout):
            return error == 'Unexpected Compile-Time Error'
        # Check crash
        return error == 'crash'

    # Get name
    name = get_name()
    name = 'Test' if name == '' and compiler == 'groovyc' else name
    if name == '':
        print(f'Error: Cannot find class for {bugid}')
        return
    filename = name + '.' + EXTENSIONS[compiler]

    for version in versions:
        # Check if already exists in db
        if bugid in db and (version in db[bugid]['buggy']
                or version in db[bugid]['not_buggy']):
            continue
        # Get compiler
        comp = get_compiler(compiler, version)
        if not os.path.isfile(comp):
            if comp not in NOT_FOUND:
                print(f'Error: {comp} does not exist')
                NOT_FOUND.append(comp)
            continue

        cwd = os.getcwd()

        # Check if compiler works
        if not check_version():
            print(f'Error: Cannot compile with {compiler}-{version}')
            continue

        with tempfile.TemporaryDirectory() as tmpdirname:
            os.chdir(tmpdirname)
            # Create file
            with open(filename, 'w') as infile:
                for line in program:
                    infile.write(line + '\n')
            # Compile
            command = "{source}; {select}; {groovy} {compile}".format(
                source='source ~/.sdkman/bin/sdkman-init.sh',
                select=f'sdk use {LANG[compiler]} {version} > /dev/null',
                groovy='' if compiler != 'groovyc' else
                f'sdk use java {GROOVY_JAVA} > /dev/null ;',
                compile=f'{compiler} {filename}'
            )
            args = ['bash', '-c', command]
            cmd = sp.Popen(args, stdout=sp.PIPE, stderr=sp.STDOUT)
            stdout, _ = cmd.communicate()
            status = cmd.returncode
            stdout = stdout.decode("utf-8")
            # Check based on error
            is_bug = check_oracle()
            # Add to db
            key = 'buggy' if is_bug else 'not_buggy'
            if bugid not in db:
                db[bugid] = {'buggy': [], 'not_buggy': []}
            db[bugid][key].append(version)
        os.chdir(cwd)


def get_args():
    parser = argparse.ArgumentParser(
        description='Get details about fixes.')
    parser.add_argument("bugs", help="File with bugs.")
    parser.add_argument("db", help="Database with history")
    return parser.parse_args()


def main():
    args = get_args()
    with open(args.bugs) as f:
        data = json.load(f)
    # The format for db is {'bugs_id': {'buggy': ['version 1'], 'not_buggy': []}}
    db = {}
    if os.path.isfile(args.db):
        with open(args.db) as f:
            db = json.load(f)
    for bug in data:
        bugid = bug['bugid']
        compiler = bug['compiler']
        symptom = bug['symptom']
        program = bug['test']
        versions = VERSION[compiler]
        print(f'Check {bugid}')
        check(bugid, compiler, versions, symptom, program, db)
        with open(args.db, 'w') as f:
            json.dump(db, f, indent=4)


if __name__ == "__main__":
    main()
