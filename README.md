# Artifact for "Finding Typing Compiler Bugs" (PLDI'22)

This is the artifact for the conditionally accepted PLDI'22 paper titled "Finding Typing Compiler Bugs".

An archived version of the artifact is also available on Zenodo. See <https://doi.org/XXX>.

# Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Setup](#setup)
- [Getting Started](#getting-started)
  * [Usage](#usage)
  * [Run Tests](#run-tests)
  * [Example](#example)
- [Step by Step Instructions](#step-by-step-instructions)
  * [Bug Database](#bug-database)
  * [RQ1: Bug-Finding Results (Section 4.2)](#rq1-bug-finding-results-section-42)
  * [RQ2: Bug and Test Case Characteristics (Section 4.3)](#rq2-bug-and-test-case-characteristics-section-43)
  * [RQ3: Effectiveness of Mutations (Section 4.4)](#rq3-effectiveness-of-mutations-section-44)
  * [RQ4: Code Coverage (Section 4.5)](#rq4-code-coverage-section-45)

# Overview

The artifact contains the instructions and scripts to re-run the evaluation 
described in our paper. The artifact has the following structure:

* `scripts/`: This is the directory that contains the scripts needed to 
re-run the experiments presented in our paper.
* `data/`: This is the directory that contains the precomputed results of our 
evaluation.
* `database/bug_schema.sql`: This is the database schema that contains the bugs 
discovered by our approach.
* `database/bugdb.sqlite3`: This is the sqlite3 database file corresponding to 
* `database/bugs.json`: This is a JSON file that contains the bugs of 
`database/bugdb.sqlite` into a JSON.
* `example_bugs/`: Contains the test programs that trigger the two compiler 
bugs demonstrated in Section II of our paper.
* `hephaestus/`: Contains the source code of the tool 
(provided as a git submodule) used in our paper for testing the compilers of 
Java, Kotlin, and Groovy.
* `installation_scripts/`: Contains helper scripts used to install all
dependencies (e.g. compiler versions from SDKMAN).
* `figures/`: This is the directory used to save figure 8 of the paper.

Note that `Hephaestus` is available as open-source software under the
GNU General Public License v3.0., and can also be reached through the following 
repository : <https://github.com/ hephaestus-compiler-project /hephaestus>.

Inside the `hephaestus` directory, there are the following directories:

* `src/`: The source code of `Hephaestus` written in Python.
* `scripts/`: Some helper scripts for trying to reproduce detected bugs.
* `tests/`: Contains the tests of `Hephaestus`.
* `deployment/`: Contains configuration and scripts to install and run
`Hephaestus` on a machine every second day.

# Requirements

See [REQUIREMENTS.md](./REQUIREMENTS.md)

# Setup

See [INSTALL.md](./INSTALL.md)

# Getting Started

We will use the Docker image from **Setup** (namely, `hephaestus`) to get started with `Hephaestus`. Recall that this image contains all the required environments for testing the three compilers (i.e., it includes installations of the corresponding compilers, as well as any other tool needed for processing the results).

You can enter a new container by using the following command:

```
docker run -ti --rm hephaestus-eval
```

## Usage

`hephaestus` provide a rich CLI with many available options. Below, we explain the most important parameters you should specify when running `hephaestus`.

```
hephaestus@e0456a9b520e:~$ hephaestus.py -h
usage: hephaestus.py [-h] [-s SECONDS] [-i ITERATIONS] [-t TRANSFORMATIONS] [--batch BATCH] [-b BUGS] [-n NAME] [-T [{TypeErasure} ...]] [--transformation-schedule TRANSFORMATION_SCHEDULE] [-R REPLAY]
                     [-e] [-k] [-S] [-w WORKERS] [-d] [-r] [-F LOG_FILE] [-L] [-N] [--language {kotlin,groovy,java}] [--disable-params-type-widening] [--disable-inverted-smart-cast]
                     [--find-classes-blacklist] [--max-type-params MAX_TYPE_PARAMS] [--min-expr-depth MIN_EXPR_DEPTH] [-P] [--timeout TIMEOUT] [--cast-numbers] [--disable-use-site-variance]
                     [--disable-contravariance-use-site]

optional arguments:
  -h, --help            show this help message and exit
  -s SECONDS, --seconds SECONDS
                        Timeout in seconds
  -i ITERATIONS, --iterations ITERATIONS
                        Iterations to run (default: 3)
  -t TRANSFORMATIONS, --transformations TRANSFORMATIONS
                        Number of transformations in each round
  --batch BATCH         Number of programs to generate before invoking the compiler
  -b BUGS, --bugs BUGS  Set bug directory (default: /home/hephaestus/hephaestus/bugs)
  -n NAME, --name NAME  Set name of this testing instance (default: random string)
  -T [{TypeErasure} ...], --transformation-types [{TypeErasure} ...]
                        Select specific transformations to perform
  --transformation-schedule TRANSFORMATION_SCHEDULE
                        A file containing the schedule of transformations
  -R REPLAY, --replay REPLAY
                        Give a program to use instead of a randomly generated (pickled)
  -e, --examine         Open ipdb for a program (can be used only with --replay option)
  -k, --keep-all        Save all programs
  -S, --print-stacktrace
                        When an error occurs print stack trace
  -w WORKERS, --workers WORKERS
                        Number of workers for processing test programs
  -d, --debug
  -r, --rerun           Run only the last transformation. If failed, start from the last and go back until the transformation introduces the error
  -F LOG_FILE, --log-file LOG_FILE
                        Set log file (default: /home/hephaestus/hephaestus/logs)
  -L, --log             Keep logs for each transformation (bugs/session/logs)
  -N, --dry-run         Do not compile the programs
  --language {kotlin,groovy,java}
                        Select specific language
  --disable-params-type-widening
                        Option for TypeSubstitution
  --disable-inverted-smart-cast
                        Option for TypeSubstitution
  --find-classes-blacklist
                        Option for ParameterizedSubstitution
  --max-type-params MAX_TYPE_PARAMS
                        Option for ParameterizedSubstitution
  --min-expr-depth MIN_EXPR_DEPTH
                        Option for IncorrectSubtypingSubstitution
  -P, --only-preserve-correctness-substitutions
                        Use only preserve correctness substitution
  --timeout TIMEOUT     Timeout for transformations (in seconds)
  --cast-numbers        Cast numeric constants to their actual type (this option is used to avoid re-occrrence of a specific Groovy bug)
  --disable-use-site-variance
                        Disable use-site variance
  --disable-contravariance-use-site
                        Disable contravariance in use-site variance
```

### `--bugs` (Optional)

Set the directory to save the results of the testing session.

NOTE: The defaults directory is `$(pwd)/bugs`.

* Example: `--bugs hephaestus-results`

### `--name` (Optional)

Name of the current testing session.

NOTE: The default name is a randomly generated 5-character long string (e.g., hl43S).

* Example: `--name test-javac-1`

### `--language` 

When running `hephaestus`, you should specify which language's the compiler you want to test. The available options are `kotlin`, `groovy`, and `java`. Hephaestus will use the selected language's compiler that is on the `PATH`. If you want to test a specific compiler version, you should configure it as the current session's default compiler.

* Example: `--language kotlin` -- `hephaestus` will test Kotlin's compiler (i.e., `kotlinc`)

## `--seconds` and `--iterations`

You should always specify either `--seconds` or `--iterations` option. The former specifies how much time `hephaestus` should test a compiler in seconds, whereas the second specifies how many test cases should `hephaestus` generate and run.

* Example 1: `--seconds 120` -- hephaestus will run for 2 minutes.

* Example 2: `--transformations 60` -- hephaestus will generate and run 60 test programs.

## `--batch` (Optional)

When running `hephaestus`, most of the testing time is spent compiling the test programs. Instead of generating one program at a time, you can specify the number of programs you want to generate before compiling them with the `--batch` option.

NOTE: The default option is 1.

* Example: `--batch 30` -- First, create 30 programs and then compile them with a single compiler execution.

## `--workers` (Optional)

When `--batch` option is larger than one, you can specify the number of workers that will generate and mutate programs in parallel.

NOTE: The default option is 1.

* Example: `--workers 4` -- Use four workers to generate and mutate test programs.

## `--transformation-types` and `--only-preserve-correctness-substitutions` 

Hephaestus supports two transformations, those that produce well-typed test programs and those that produce ill-typed test programs. Currently, `hephaestus` implements two mutators: Type Erasure Mutator (TEM) and Type Overwriting Mutator (TOM). The former produces well-typed programs, whereas the latter produces ill-typed. 

By default TOM is running always after generating a test program and perform correctness-preserving mutations on it. To disable TOM you should use the option `--only-preserve-correctness-substitutions`.

`--transformation-types` option specifies which mutations, that produce well-typed programs, can be used during a testing session. Currently, `hephaestus` implements only one mutator that produces well-typed programs (i.e., TEM).

WARNING: Although you can use the mutators in combination, they have not been rigorously tested.

* Example: `--transformation-types TypeErasure` -- enable TypeErasure mutation.

## `--transformations` and `--transformation-schedule`

You should always specify one of those options. `--transformations` specify the number of mutations that should be applied per test program. If the value is `0`, `hephaestus` will run only the generator. Note that this option only specifies how many correctness-preserving mutations should be run.

`--transformation-schedule` expects a path for a file containing the schedule of transformations. This file should specify a transformation per line.

* Example 1: `--transformations 0` -- Do not perform any transformation

* Example 2: `--transformation-schedule transformations.txt` -- Perform the transformations declared in file `transformations.txt`. The `transformations.txt` file could contain the following.

```
TypeErasure
```

## `--keep-all` (Optional)

`hephaestus` only save programs that cause a compiler error.
When `--keep-all` is enabled, `hephaestus` will save all generated and mutated test programs.

* Example: `--keep-all`

## `--dry-run` (Optional)

When this option is used, `hephaestus` only produces and mutates test programs, i.e. it does not test the compiler.

NOTE: always use this option with `-keep-all`.

* Example: `--dry-run`

## `--log-file` (Optional)

By default, `hephaestus` keeps logs of testing sessions in a file called `logs` in the working directory. With `--log-file` option, you can specify another file to save the logs.

* Example: `--log-file my_logs`

## `--replay` (Optional)

Use a seed program instead of `hephaestus`'s generated programs. 

NOTE: The input program should be pickled.

* Example: `--replay bugs/idET7/generator/iter_1/Main.java.bin`

## `--debug` (Debugging option)

Print debug messages before every step (i.e. program generation, mutation, compilation).

NOTE: Use this option only when `--workers` option is set to 1 and `-batch` is set to 1.

* Example: `--debug`

## `--examine` (Debugging option)

Open a debugger session to inspect the IR of the generated program.

NOTE: This option can only be used with `--replay` option.

## `--print-stacktrace` (Debugging option)

Print stacktaces for `hephaestus` internal errors. 

* Example: `--print-stacktrace`

## `--cast-numbers` (Optional)

This option is used to cast numeric constants to their actual type in Groovy programs. This option is used to avoid the re-occurrence of a specific Groovy bug.

NOTE: This option has an effect only when `--language` is set to `groovy`.

* Example: `--cast-numbers`

## `--disable-use-site-variance` (Optional)

Generate programs that do not use use-site variance.

* Example: `--disable-use-site-variance`

## `--disable-contravariance-use-site` (Optional)

Generate programs that do not use contravariance in use-site variance.

## `--max-type-params` (Optional)

Specify the number maximum number of type parameters for a parameterized class.

NOTE: the default value is `3`.

Example: `--max-type-params 5`

## Run Tests

To run `hephaestus` tests you should execute the following commands:

```
# Enter hephaestus directory
hephaestus@e0456a9b520e:~$ cd hephaestus
# Run tests
hephaestus@e0456a9b520e:~/hephaestus$ python setup.py test
```

The output of the previous command should be similar to the following:

```
tests/test_call_analysis.py::test_program1 PASSED                       [  0%]
...
tests/test_use_analysis.py::test_program7 PASSED                        [100%]
tests/test_use_analysis.py::test_program8 PASSED                        [100%]
============================ 154 passed in 0.55s =============================
```

## Example

Here, we will test the Kotlin compiler by employing hephaestus' program generator . Specifically with the following command we are going to produce 30 test programs in batches of 10 test programs using 2 workers.

```
hephaestus@e0456a9b520e:~/hephaestus$ hephaestus.py \
    --language kotlin --transformations 0 \
    --batch 10 --iterations 30 --workers 2
```

The expected outcome is:

```
stop_cond             iterations (30)
transformations       0
transformation_types
bugs                  /home/hephaestus/bugs
name                  gWYHl
language              kotlin
compiler              info: kotlinc-jvm 1.5.31 (JRE 18-ea+35-2085)
===============================================================================
Test Programs Passed 30 / 30 ✔          Test Programs Failed 0 / 30 ✘
```

Two files are generated inside `/home/hephaestus/bugs/gWYH`: 
`stats.json` and `faults.json`.

`stats.json` contains the following details about the testing session.

```
{
  "Info": {
    "stop_cond": "iterations",
    "stop_cond_value": 30,
    "transformations": 0,
    "transformation_types": "",
    "bugs": "/home/hephaestus/bugs",
    "name": "gWYHl",
    "language": "kotlin",
    "compiler": "info: kotlinc-jvm 1.5.31 (JRE 18-ea+35-2085)"
  },
  "totals": {
    "passed": 30,
    "failed": 0
  }
}
```

In this example, `faults.json` is empty. If there were some bugs detected,
`faults.json` would look like the following JSON file.

```
"326": {
    "transformations": [
      "TypeErasure"
    ],
    "error": "type argument is not within its bounds: should be subtype of 'CapturedType(out Int)'",
    "programs": {
      "/tmp/tmpesvj9j_f/src/apologias/program.kt": true,
      "/tmp/tmpesvj9j_f/src/trims/program.kt": false
    }
},
"414": {
    "transformations": [
      "TypeOverwriting"
    ],
    "error": "SHOULD NOT BE COMPILED: Array<Boolean(kotlin-builtin)> expected but String(kotlin-builtin) found in node global/jerseys/fandom/Critiqued/beatify/Yearling",
    "programs": {
      "/tmp/tmpru0kfhkr/src/polyamory/program.kt": true,
      "/tmp/tmpru0kfhkr/src/giddier/program.kt": false
    }
"502": {
    "transformations": [],
    "error": "maximum recursion depth exceeded in comparison",
    "program": null
  },

```

The first error is an unexpected compile-time error detected using the Type Erasure mutation. The second is a compiler bug where the compiler accepts an ill-typed program. Finally, the third one is an internal error of `hephaestus`. 

In the above scenario, the testing session directory would be like the following:

```
|-- 326
|   |-- program.kt
|   `-- program.kt.bin
|-- 414
|   |-- incorrect.kt
|   |-- incorrect.kt.bin
|   |-- program.kt
|   `-- program.kt.bin
|-- faults.json
`-- stats.json
```

Now, you can exit the Docker container by running:

```
hephaestus@e0456a9b520e:~$ exit
```

# Step By Step Instructions

To validate the main results presented in the paper, first create a new Docker container by running:

```
docker run -ti --rm \
  -v $(pwd)/database:/home/hephaestus/database \
  -v $(pwd)/data:/home/hephaestus/data \
  -v $(pwd)/scripts:/home/hephaestus/eval-scripts \
  -v $(pwd)/figures:/home/hephaestus/eval-figures \
  hephaestus-eval
```

Note that we mount four local volumes inside the newly-created container. The first volume (`database/`) contains the bug database that includes the bugs discovered by our approach, while the second volume (`data/`) provides the data collected during our evaluation. The third volume (`eval-scripts/`) includes some scripts to reproduce and validate the results of the paper. Finally, the fourth volume (`eval-figures/`) will be used to save Figure 8 of our paper.

## Bug Database

We provide an SQLite database (see the file `bugs/bugdb.sqlite3`) that contains information about the bugs discovered by our approach during the evaluation. This database is initialized based on the SQL script stored into `bugs/bug_schema.sql`. The bug database consists of three tables, namely `CompilerBug`, `Characteristic`, and `CompilerBugCharacteristics`. 

Each record of the `CompilerBug` table consists of the following columns.

* `bid`: A serial number corresponding to the ID of the bug.
* `bug_id`: The bug id as displayed in the corresponding issue tracker.
* `language`: The name of the programming language of the test program.
* `compiler`: The name of the compiler where the bug was found.
* `title`: The title of the bug report.
* `issue_tracker_link`: A URL pointing to the bug report opened by us.
* `mutator`: The component that detected the bug. There are four possible values: generator, soundness (i.e., TOM), inference (i.e., TEM), and inference/soundness (i.e., TEM and then TOM).
* `fix_link`: A URL pointing to the fix of the bug.
* `severity`: The severity of the bugs given by the developers.
* `status`: The status of the bug.
* `resolution`: The resolution of the bug (e.g., Fixed, Duplicate).
* `report_date`: The date that we reported the bug.
* `resolution_date`: The date that the developers resolved the bug.
* `symptom`: The symptom of the bug. There are three possible values: unexpected compile-time error (UCTE), unexpected runtime behavior (URB), and crash.
* `resolved_in`: How long did it take to resolve this bug.
* `test`: The test program that revealed the bug.
* `error_msg`: The error message reported by the compiler, or the stacktrace of the crash, or the exception caused in the runtime.

The `Characteristic` table contains the following three fields.

* `cid`: A serial number corresponding to the ID of the characteristic.
* `characteristic_name`: The name of the characteristic (e.g., Parameterized class).
* `category`: The category of the characteristic (e.g. Parametric polymorphism).

Finally, `CompilerBugCharacteristics` is a table implementing the many-to-many relationship between `CompilerBug` and `CompilerBugCharacteristics`, this table contains three fields: `bcid`, `cid`, `bid`.

### Example Queries

From inside the container, we can perform some basic queries on this bug database.

Get the total number of the discovered bugs.

```
hephaestus@5021c7920e54:~$ sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug";
153
```

Find the number of `groovyc` bugs.

```
sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug WHERE compiler = 'groovyc'";
110
```

Find the number of `javac` bugs that have UCTE as their symptom.

```
hephaestus@5021c7920e54:~$ sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug WHERE compiler = 'javac' AND symptom = 'Unexpected Compile-Time Error'";
7
```

For each Kotlin bug revealed by TEM (i.e., soundness mutator), dump the URLs pointing to our bug reports.

```
hephaestus@5021c7920e54:~$ sqlite3 database/bugdb.sqlite3 "SELECT issue_tracker_link FROM CompilerBug WHERE compiler = 'kotlinc' AND mutator = 'inference'";
https://youtrack.jetbrains.com/issue/KT-45118
https://youtrack.jetbrains.com/issue/KT-49092
https://youtrack.jetbrains.com/issue/KT-48764
https://youtrack.jetbrains.com/issue/KT-49024
https://youtrack.jetbrains.com/issue/KT-43846
https://youtrack.jetbrains.com/issue/KT-44082
https://youtrack.jetbrains.com/issue/KT-44742
https://youtrack.jetbrains.com/issue/KT-44595
https://youtrack.jetbrains.com/issue/KT-44551
https://youtrack.jetbrains.com/issue/KT-47184
https://youtrack.jetbrains.com/issue/KT-46684
https://youtrack.jetbrains.com/issue/KT-44651
```

Get the three most common characteristics in the test cases of the reported bugs.

```
sqlite3 database/bugdb.sqlite3 "SELECT c.characteristic_name, COUNT(*) as total FROM CompilerBugCharacteristics as cbc JOIN Characteristic as c ON c.cid = cbc.cid GROUP BY cbc.cid ORDER BY total DESC LIMIT 3";
Parameterized class|96
Parameterized type|77
Bounded type parameter|50
```

## RQ1: Bug-Finding Results (Section 4.2)

For the first research question, first we will use `database/bugs.json` to reproduce Figure 7a that shows how many bugs (and their status) were found in each tested compiler. To do so, run:

```
hephaestus@0f0e136c9699:~$ python eval-scripts/process_bugs.py database/bugs.json rq1
                         Figure 7a
============================================================
Status              groovyc   kotlinc   Java      Total
------------------------------------------------------------
Reported            0         12        0         12
Confirmed           46        8         3         57
Fixed               60        9         2         71
Wont fix            2         2         5         9
Duplicate           2         1         1         4
------------------------------------------------------------
Total               110       32        11        153
```

Next to produce Figure 8 and compute the numbers of **"Affected compiler versions"** paragraph run the following script.

```
hephaestus@65dcb5e94149:~$ python eval-scripts/history_analysis.py data/history/history_19_11_21.json eval-figures/bug_versions.pdf
groovyc
All versions are buggy: 35
The error exist only in master: 50
Regressions: 25

kotlinc
All versions are buggy: 14
The error exist only in master: 5
Regressions: 13

javac
All versions are buggy: 6
The error exist only in master: 2
Regressions: 3

Compiler Affected stable versions  Bugs
0   kotlinc                    [1-3]     5
1   kotlinc                     > 12     1
2   kotlinc                    [7-9]     7
3   kotlinc                      All    14
4   kotlinc              master only     5
5   groovyc                    [1-3]    15
6   groovyc              master only    50
7   groovyc                      All    35
8   groovyc                    [4-6]     1
9   groovyc                     > 12     3
10  groovyc                  [10-12]     6
11    javac              master only     2
12    javac                      All     6
13    javac                    [1-3]     2
14    javac                    [4-6]     1
```

This script will also generate Figure 8 and save it at `figures/bug_versions.pdf` in your host machine.

The statements that we want to check from paragraph **"Affected compiler versions"** are the following:

* 35 `groovyc` and 14 `kotlinc` bugs occur in all stable compiler versions.
* A large portion of `groovyc` bugs (50/110 -- 45%) are triggered only in the master branch of the compiler.

### Re-run Affected Compiler Versions Experiments. (Optional)

To re-compute which compiler versions are affected you can run the following command (it will take around 90 minutes):

```
python scripts/history_run.py database/bugs.json history.json
```

NOTE: The results might be slightly different because (1) SDKMAN does not support the same compiler version, (2) some bugs may have been fixed by the developers.

## RQ2: Bug and Test Case Characteristics (Section 4.3)

For the second research question, we will use `database/bugs.json` to reproduce Figure 78 that shows the symptoms of the reported bugs. Furthermore, we will the most popular features used in the bug-revealing test programs. To do so, run:

```
hephaestus@9dfe76e26efa:~$ python eval-scripts/process_bugs.py database/bugs.json rq2
                         Figure 7b
============================================================
Symptoms            groovyc   kotlinc   Java      Total
------------------------------------------------------------
UCTE                77        17        7         101
URB                 19        3         0         22
Crash               14        12        4         30



================================================================================
Characteristics
--------------------------------------------------------------------------------
Parameterized class          96   Parametric polymorphism
Parameterized type           77   Parametric polymorphism
Bounded type parameter       50   Parametric polymorphism
Type argument inference      35   Type inference
Lambda                       34   Functional programming
Conditionals                 32   Standard language features
Inheritance                  31   OOP features
Subtyping                    30   Type system-related features
Function type                27   Functional programming
Variable type inference      24   Type inference
Use-site variance            23   Parametric polymorphism
Parameterized function       23   Parametric polymorphism
Flow typing                  12   Type inference
Array                        11   Standard language features
Primitive type               10   Type system-related features
Function reference           9    Functional programming
Overriding                   8    OOP features
SAM type                     5    Functional programming
Variable arguments           4    Standard language features
Return type inference        4    Type inference
Declaration-site variance    2    Parametric polymorphism
Named arguments              1    Other
Cast                         1    Standard language features
================================================================================

================================================================================
Categories
--------------------------------------------------------------------------------
Parametric polymorphism      104
Type inference               61
Standard language features   44
Type system-related features 38
Functional programming       38
OOP features                 31
Other                        1
================================================================================
```

Beyond Figure 7b, this script produces the number used in Section 4.3.
Specifically, Section 4.3 contains the following statements:

* Features related to parametric polymorphism (e.g., parameterized class) are in the list of features with the most bug-revealing capability. 
* In total, 104/153 bugs are caused by programs containing at least one such feature (parametric polymorphism).
* In 47% of test cases that use conditionals, type inference features are also included.

To see the results for how features are used with other features you can use the option `--combinations` in the previous script, and it will print the following.

```
Combinations
==============================================================================
Parameterized class           Parametric polymorphism          93
Parameterized class           OOP features                     24
Parameterized class           Type inference                   42
Parameterized class           Type system-related features     18
Parameterized class           Standard language features       23
Parameterized class           Functional programming           13
Parameterized type            Parametric polymorphism          77
Parameterized type            OOP features                     23
Parameterized type            Type system-related features     17
Parameterized type            Standard language features       22
Parameterized type            Type inference                   34
Parameterized type            Functional programming            6
Use-site variance             Parametric polymorphism          22
Use-site variance             OOP features                      6
Use-site variance             Type system-related features      5
Use-site variance             Standard language features        3
Use-site variance             Type inference                    7
Use-site variance             Functional programming            1
Bounded type parameter        Parametric polymorphism          50
Bounded type parameter        Type inference                   20
Bounded type parameter        Type system-related features      9
Bounded type parameter        OOP features                     12
Bounded type parameter        Standard language features       13
Bounded type parameter        Functional programming            6
Inheritance                   Parametric polymorphism          24
Inheritance                   OOP features                      8
Inheritance                   Type system-related features     18
Inheritance                   Standard language features       11
Inheritance                   Type inference                   13
Inheritance                   Functional programming            3
Type argument inference       Parametric polymorphism          35
Type argument inference       Type inference                    9
Type argument inference       Functional programming            4
Type argument inference       Standard language features        9
Type argument inference       Type system-related features      7
Type argument inference       OOP features                      7
Primitive type                Parametric polymorphism           2
Primitive type                OOP features                      2
Primitive type                Standard language features        3
Primitive type                Functional programming            2
Primitive type                Type system-related features      2
Overriding                    Type system-related features      4
Overriding                    Parametric polymorphism           8
Overriding                    OOP features                      8
Overriding                    Standard language features        4
Overriding                    Type inference                    2
Parameterized function        Parametric polymorphism          18
Parameterized function        Standard language features        6
Parameterized function        Type inference                   10
Parameterized function        Type system-related features      3
Parameterized function        OOP features                      2
Parameterized function        Functional programming            4
Conditionals                  Parametric polymorphism          18
Conditionals                  Type system-related features     13
Conditionals                  OOP features                      9
Conditionals                  Functional programming            5
Conditionals                  Type inference                   15
Conditionals                  Standard language features        2
Subtyping                     Parametric polymorphism          17
Subtyping                     OOP features                     16
Subtyping                     Functional programming            7
Subtyping                     Type system-related features      2
Subtyping                     Type inference                   14
Subtyping                     Standard language features       14
Lambda                        Functional programming           25
Lambda                        Standard language features        6
Lambda                        Type inference                   15
Lambda                        Parametric polymorphism          14
Lambda                        Type system-related features      7
Lambda                        OOP features                      2
Function type                 Functional programming           26
Function type                 Standard language features        5
Function type                 Parametric polymorphism          10
Function type                 Type system-related features      6
Function type                 Type inference                    7
Function type                 OOP features                      3
Variable type inference       Type inference                   12
Variable type inference       Functional programming            9
Variable type inference       Parametric polymorphism          15
Variable type inference       Type system-related features      3
Variable type inference       OOP features                      3
Variable type inference       Standard language features        6
Flow typing                   Type inference                    6
Flow typing                   Functional programming            5
Flow typing                   Type system-related features      3
Flow typing                   OOP features                      4
Flow typing                   Standard language features        4
Flow typing                   Parametric polymorphism           1
Function reference            Functional programming            9
Function reference            Parametric polymorphism           4
Function reference            Type inference                    1
Function reference            Standard language features        1
Function reference            OOP features                      1
Function reference            Type system-related features      1
Array                         Type system-related features      5
Array                         Type inference                    3
Array                         OOP features                      2
Array                         Standard language features        4
Array                         Parametric polymorphism           4
Array                         Functional programming            2
Variable arguments            Parametric polymorphism           4
Variable arguments            Functional programming            1
Variable arguments            Standard language features        1
Variable arguments            Type inference                    2
Variable arguments            OOP features                      1
Cast                          Standard language features        1
SAM type                      Functional programming            5
SAM type                      Parametric polymorphism           3
SAM type                      Type system-related features      1
Return type inference         Type system-related features      3
Return type inference         OOP features                      3
Return type inference         Standard language features        2
Return type inference         Functional programming            1
Return type inference         Parametric polymorphism           2
Return type inference         Type inference                    1
Declaration-site variance     Type inference                    1
Declaration-site variance     Parametric polymorphism           2
Declaration-site variance     OOP features                      1
```

## RQ3: Effectiveness of Mutations (Section 4.4)

For the third research question, first we will use `database/bugs.json` to reproduce Figure 7c that shows how many bugs does each component revealed. To do so, run:

```
hephaestus@fe6883e92441:~$ python eval-scripts/process_bugs.py database/bugs.json rq3
                         Figure 7c
============================================================
Component           groovyc   kotlinc   Java      Total
------------------------------------------------------------
Generator           54        16        7         77
TEM                 35        12        3         50
TOM                 20        3         1         24
TEM & TOM           1         1         0         2
```

Next, we are going to compute the results of Figure 9 per compiler.
In the `data/coverage/mutations/` directory we provide the results of JaCoCo on 5k random test programs per compiler saved at `data/test_programs/mutations`.

* `groovyc`

```
# TEM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/groovy/groovy-generator-inf.csv \
    data/coverage/mutations/groovy/groovy-combination-inf.csv \
    data/coverage/mutations/groovy/groovy_whitelist --increasepkg
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           42.68              41.77              42.07
Combination                       43.14              42.14              42.52
% change                           0.46               0.37               0.45
Absolute change                     167                 27                752

org.codehaus.groovy.control.messages: Branch -- 44 (66.67), Line -- 12 (70.59), Func -- 3 (75.00)
org.codehaus.groovy.transform.stc: Branch -- 531 (4.58), Line -- 106 (4.25), Func -- 13 (3.58)
total: Branch -- 752 (1.07), Line -- 167 (1.09), Func -- 27 (0.87)
org.codehaus.groovy.transform.sc: Branch -- 8 (0.96), Line -- 1 (0.57), Func -- 0 (0.00)
org.codehaus.groovy.ast: Branch -- 54 (0.76), Line -- 13 (0.79), Func -- 3 (0.61)
org.codehaus.groovy.classgen.asm: Branch -- 48 (0.57), Line -- 15 (0.76), Func -- 3 (0.80)
org.codehaus.groovy.control: Branch -- 32 (0.49), Line -- 10 (0.65), Func -- 3 (1.11)
org.codehaus.groovy.transform.sc.transformers: Branch -- 2 (0.22), Line -- 0 (0.00), Func -- 0 (0.00)
org.apache.groovy.parser.antlr4: Branch -- 30 (0.17), Line -- 9 (0.28), Func -- 1 (0.16)
org.codehaus.groovy.ast.expr: Branch -- 3 (0.16), Line -- 1 (0.19), Func -- 1 (0.49)

# TOM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py g data/coverage/mutations/groovy/groovy-generator-sound.csv data/coverage/mutations/groovy/groovy-combination-sound.csv data/coverage/mutations/groovy/groovy_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           43.30              42.21              42.72
Combination                       43.57              42.35              42.99
% change                           0.27               0.14               0.27
Absolute change                      99                 10                447
```

* `kotlinc`

```
# TEM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py k \
    data/coverage/mutations/kotlin/kotlin-generator-inf.csv \
    data/coverage/mutations/kotlin/kotlin-combination-inf.csv \
    data/coverage/mutations/kotlin/kotlin_whitelist --increasepkg
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           30.92              30.60              30.32
Combination                       31.38              31.00              30.78
% change                           0.46               0.39               0.46
Absolute change                     787                217               5431

org.jetbrains.kotlin.resolve.calls.inference.constraintPosition: Branch -- 83 (73.45), Line -- 6 (54.55), Func -- 5 (100.00)
org.jetbrains.kotlin.resolve.calls.inference: Branch -- 1114 (72.72), Line -- 146 (71.57), Func -- 43 (52.44)
org.jetbrains.kotlin.resolve.typeBinding: Branch -- 136 (60.44), Line -- 16 (50.00), Func -- 6 (54.55)
org.jetbrains.kotlin.resolve.calls.tower: Branch -- 938 (10.98), Line -- 137 (10.69), Func -- 36 (10.98)
org.jetbrains.kotlin.resolve.calls.inference.model: Branch -- 202 (9.36), Line -- 23 (6.97), Func -- 10 (7.35)
org.jetbrains.kotlin.resolve.calls.inference.components: Branch -- 466 (8.50), Line -- 63 (7.91), Func -- 5 (2.50)
org.jetbrains.kotlin.psi.psiUtil: Branch -- 59 (8.35), Line -- 10 (12.66), Func -- 2 (4.26)
org.jetbrains.kotlin.types: Branch -- 666 (7.08), Line -- 103 (7.03), Func -- 56 (12.33)
org.jetbrains.kotlin.resolve.calls: Branch -- 223 (5.23), Line -- 48 (7.35), Func -- 2 (1.71)
org.jetbrains.kotlin.resolve.calls.tasks: Branch -- 14 (4.11), Line -- 3 (5.66), Func -- 1 (3.85)
org.jetbrains.kotlin.resolve.constants.evaluate: Branch -- 125 (3.86), Line -- 22 (4.33), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.calls.components: Branch -- 218 (3.53), Line -- 32 (3.88), Func -- 6 (2.27)
org.jetbrains.kotlin.resolve.calls.model: Branch -- 80 (3.18), Line -- 11 (2.70), Func -- 9 (5.49)
org.jetbrains.kotlin.types.checker: Branch -- 127 (2.95), Line -- 16 (3.54), Func -- 7 (2.73)
org.jetbrains.kotlin.descriptors.annotations: Branch -- 33 (2.83), Line -- 6 (4.23), Func -- 2 (3.77)
org.jetbrains.kotlin.types.expressions: Branch -- 164 (2.28), Line -- 28 (2.16), Func -- 6 (2.18)
org.jetbrains.kotlin.resolve.descriptorUtil: Branch -- 15 (2.24), Line -- 1 (1.32), Func -- 1 (2.04)
org.jetbrains.kotlin.diagnostics: Branch -- 87 (2.10), Line -- 14 (1.26), Func -- 3 (1.96)
org.jetbrains.kotlin.resolve.calls.util: Branch -- 10 (1.90), Line -- 1 (1.06), Func -- 1 (1.72)
org.jetbrains.kotlin.resolve.jvm: Branch -- 33 (1.80), Line -- 4 (1.23), Func -- 1 (1.12)
org.jetbrains.kotlin.resolve.calls.smartcasts: Branch -- 46 (1.64), Line -- 5 (1.20), Func -- 1 (0.88)
total: Branch -- 5431 (1.52), Line -- 787 (1.48), Func -- 217 (1.29)
org.jetbrains.kotlin.cfg: Branch -- 74 (1.40), Line -- 13 (1.49), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve: Branch -- 358 (1.38), Line -- 52 (1.28), Func -- 7 (0.80)
org.jetbrains.kotlin.resolve.constants: Branch -- 13 (0.85), Line -- 1 (0.46), Func -- 1 (0.97)
org.jetbrains.kotlin.psi: Branch -- 45 (0.80), Line -- 7 (0.64), Func -- 4 (0.70)
org.jetbrains.kotlin.cli.jvm.compiler: Branch -- 40 (0.76), Line -- 7 (0.90), Func -- 1 (0.70)
org.jetbrains.kotlin.parsing: Branch -- 31 (0.52), Line -- 9 (0.77), Func -- 0 (0.00)
org.jetbrains.kotlin.cli.common.messages: Branch -- 5 (0.40), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.cli.jvm: Branch -- 4 (0.24), Line -- 1 (0.39), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.calls.checkers: Branch -- 6 (0.20), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.psi2ir.transformations: Branch -- 2 (0.14), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.calls.results: Branch -- 2 (0.13), Line -- 1 (0.40), Func -- 0 (0.00)
org.jetbrains.kotlin.diagnostics.rendering: Branch -- 5 (0.11), Line -- 1 (0.11), Func -- 1 (1.30)
org.jetbrains.kotlin.renderer: Branch -- 3 (0.07), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.jvm.checkers: Branch -- 2 (0.06), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.checkers: Branch -- 2 (0.05), Line -- 0 (0.00), Func -- 0 (0.00)

# TOM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py g data/coverage/mutations/kotlin/kotlin-generator-sound.csv data/coverage/mutations/kotlin/kotlin-combination-sound.csv data/coverage/mutations/kotlin/kotlin_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           31.47              31.01              30.87
Combination                       31.80              31.31              31.22
% change                           0.33               0.30               0.35
Absolute change                     572                166               4171
```

* `javac`

```
# TEM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py g data/coverage/mutations/java/java-generator-inf.csv data/coverage/mutations/java/java-combination-inf.csv data/coverage/mutations/java/java_whitelist --increasepkg
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           36.99              39.68              34.56
Combination                       37.68              40.49              35.18
% change                           0.68               0.81               0.62
Absolute change                     396                 87               2150

com.sun.tools.javac.code: Branch -- 636 (3.27), Line -- 131 (3.31), Func -- 31 (3.16)
com.sun.tools.javac.comp: Branch -- 1200 (3.06), Line -- 204 (2.66), Func -- 47 (3.59)
total: Branch -- 2150 (1.79), Line -- 396 (1.85), Func -- 87 (2.05)
com.sun.tools.javac.util: Branch -- 129 (1.60), Line -- 29 (1.60), Func -- 5 (1.10)
com.sun.tools.javac.parser: Branch -- 59 (0.86), Line -- 14 (0.93), Func -- 0 (0.00)
com.sun.tools.javac.resources: Branch -- 109 (0.62), Line -- 13 (3.20), Func -- 2 (10.00)
com.sun.tools.javac.tree: Branch -- 12 (0.23), Line -- 4 (0.33), Func -- 2 (0.53)
com.sun.tools.javac.main: Branch -- 5 (0.11), Line -- 1 (0.12), Func -- 0 (0.00)

# TOM
hephaestus@0f633ede0d56:~$ python eval-scripts/compute_coverage.py g data/coverage/mutations/java/java-generator-sound.csv data/coverage/mutations/java/java-combination-sound.csv data/coverage/mutations/java/java_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           37.63              40.46              35.18
Combination                       38.26              41.19              35.76
% change                           0.62               0.74               0.57
Absolute change                     362                 79               1990
```

### Reproducing RQ3's Coverage Experiment

To re-run the complete experiment, depending on your machine(s), could take up to 5 days. Here, we will provide a complete example of how you get the coverage of a total of 10 Groovy test programs for both TEM and TOM, using JaCoCo. To reproduce the full results, you should (1) produce 5k programs for both TOM and TEM, and (2) run the same experiments for the other compilers by replacing `groovy` with `java` and `kotlin` in the following commands.

#### Minimized Groovy Coverage Example

* Step 1: Generate the test programs.

```
hephaestus.py --bugs coverage_programs --name groovy_tem_10 --language groovy \
    --iterations 10 --batch 10 --workers 2 --transformations 1 \
    --keep-all --dry-run --only-preserve-correctness-substitutions
hephaestus.py --bugs coverage_programs --name groovy_tom_10 --language groovy \
    --iterations 10 --batch 10 --workers 2 --transformations 0 \
    --keep-all --dry-run 
```

* Step 2: Produce coverage reports for generator and TEM.

```
./eval-scripts/coverage/groovy_mutations.sh $HOME/coverage \
    $HOME/coverage_programs/groovy_tem_10/ 10 inference 2> /dev/null
```

* Step 3: Compute the results for generator and TEM.

```
python eval-scripts/compute_coverage.py g \
    results/groovy/groovy-generator-inference.csv \
    results/groovy/groovy-comb-inference.csv \
    data/coverage/mutations/groovy/groovy_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           38.79              39.87              37.75
Combination                       38.82              39.88              37.78
% change                           0.04               0.01               0.03
Absolute change                      13                  1                 50
```

* Step 4: Produce coverage reports for generator and TOM.

```
./eval-scripts/coverage/groovy_mutations.sh $HOME/coverage \
    $HOME/coverage_programs/groovy_tem_10/ 10 2> /dev/null
```

* Step 5: Compute the results for generator and TOM.

```
python eval-scripts/compute_coverage.py g \
    results/groovy/groovy-generator-soundness.csv \
    results/groovy/groovy-comb-soundness.csv \
    data/coverage/mutations/groovy/groovy_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           38.79              39.87              37.75
Combination                       38.84              39.95              37.79
% change                           0.06               0.08               0.04
Absolute change                      20                  6                 68
```

#### Complete Experiment



## RQ4: Code Coverage (Section 4.5)

For the fourth research question, we will use coverage data from `data/coverage/compilers/` to reproduce Figure 10 that shows the code coverage improvement when adding 10k programs produced by `hephaestus` to the test suites of the compiler. In the following, we compute the results per compiler.

* `groovyc`

```
hephaestus@94771ee464b4:~$ python eval-scripts/compute_coverage.py g data/coverage/compilers/groovy/groovy-vanilla.csv data/coverage/compilers/groovy/groovy-hephaestus.csv data/coverage/compilers/groovy/groovy_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           82.00              71.77              78.38
Combination                       82.06              71.79              78.44
% change                           0.06               0.02               0.05
```

* `kotlinc`

```
python eval-scripts/compute_coverage.py g data/coverage/compilers/kotlin/kotlin-vanilla.csv data/coverage/compilers/kotlin/kotlin-hephaestus.csv data/coverage/compilers/kotlin/kotlin_whitelist --compiler
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           80.80              72.99              74.08
Combination                       80.83              73.05              74.11
% change                           0.03               0.06               0.04
```

NOTE: Our results are slightly different from the submitted paper. We will update Figure 10 on the camera-ready paper to match the results of our artifact.


* `javac`

```
python eval-scripts/compute_coverage.py g data/coverage/compilers/java/java-vanilla.csv data/coverage/compilers/java/java-hephaestus.csv data/coverage/compilers/java/java_whitelist --compiler
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           83.76              83.95              83.90
Combination                       83.94              83.99              84.12
% change                           0.18               0.03               0.22
```

NOTE: Our results are slightly different from the submitted paper. We will update Figure 10 on the camera-ready paper to match the results of our artifact.

### Re-run JaCoCo to compute coverage data (Optional)

### Re-run hephaestus to produce 10k test programs per language (Optional)

