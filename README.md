# Artifact for "Finding Typing Compiler Bugs" (PLDI'22)

This artifact is for the conditionally accepted PLDI'22 paper titled
"Finding Typing Compiler Bugs".

An archived version of the artifact is also available on Zenodo.
See https://doi.org/XXX.

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

* `scripts/`: This directory contains the scripts needed to re-run the
experiments presented in our paper.
* `data/`: This is the directory that contains the precomputed results of our
evaluation.
* `database/bug_schema.sql`: This is the database schema that contains the bugs
discovered by our approach.
* `database/bugdb.sqlite3`: This is the `sqlite3` database file corresponding to
  our bug database.
* `database/bugs.json`: This JSON file contains the bugs
of `database/bugdb.sqlite`.
* `example_bugs/`: Contains the test programs that trigger the two compiler
bugs demonstrated in Section II of our paper.
* `hephaestus/`: Contains the source code of the tool
(provided as a git submodule) used for testing the compilers of
Java, Kotlin, and Groovy. The name of our tool is `Hephaestus`.
* `installation_scripts/`: Contains helper scripts used to install all
dependencies (e.g., compiler versions from SDKMAN).
* `figures/`: This directory will be used to save figure 8 of the paper.
* `Dockerfile`: The Dockerfile used to create a Docker image of our artifact.
  This image contains all data and dependencies.

`Hephaestus` is available as open-source software under the
GNU General Public License v3.0, and can also be reached through the following
repository: https://github.com/hephaestus-compiler-project/hephaestus.

Inside the `hephaestus/` directory, there are the following directories:

* `src/`: The source code of `Hephaestus`, which is written in Python.
* `tests/`: Contains the tests of `Hephaestus`.
* `deployment/`: Contains configuration and scripts to install and run
`Hephaestus` on a machine every second day.

# Requirements

See [REQUIREMENTS.md](./REQUIREMENTS.md)

# Setup

See [INSTALL.md](./INSTALL.md)

# Getting Started

We will use the Docker image from [Setup](#Setup) (namely, `hephaestus-eval`)
to get started with `Hephaestus`. Recall that this image contains all the
required environments for testing the three compilers (i.e., it includes
installations of the corresponding compilers, as well as any other tool
needed for processing the results).

You can enter a new container by using the following command:

```
docker run -ti --rm hephaestus-eval
```

## Usage

`hephaestus` provides a rich CLI with many available options. Below, we explain
the most important parameters you should specify when running `hephaestus`.

```
hephaestus@e0456a9b520e:~$ hephaestus.py --help
usage: hephaestus.py [-h] [-s SECONDS] [-i ITERATIONS] [-t TRANSFORMATIONS] [--batch BATCH] [-b BUGS] [-n NAME] [-T [{TypeErasure} [{TypeErasure} ...]]]
                     [--transformation-schedule TRANSFORMATION_SCHEDULE] [-R REPLAY] [-e] [-k] [-S] [-w WORKERS] [-d] [-r] [-F LOG_FILE] [-L] [-N] [--language {kotlin,groovy,java}]
                     [--max-type-params MAX_TYPE_PARAMS] [--max-depth MAX_DEPTH] [-P] [--timeout TIMEOUT] [--cast-numbers] [--disable-use-site-variance] [--disable-contravariance-use-site]
                     [--disable-bounded-type-parameters] [--disable-parameterized-functions]

optional arguments:
  -h, --help            show this help message and exit
  -s SECONDS, --seconds SECONDS
                        Timeout in seconds
  -i ITERATIONS, --iterations ITERATIONS
                        Iterations to run (default: 3)
  -t TRANSFORMATIONS, --transformations TRANSFORMATIONS
                        Number of transformations in each round (default: 0)
  --batch BATCH         Number of programs to generate before invoking the compiler
  -b BUGS, --bugs BUGS  Set bug directory (default: /home/hephaestus/bugs)
  -n NAME, --name NAME  Set name of this testing instance (default: random string)
  -T [{TypeErasure} [{TypeErasure} ...]], --transformation-types [{TypeErasure} [{TypeErasure} ...]]
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
                        Set log file (default: /home/hephaestus/logs)
  -L, --log             Keep logs for each transformation (bugs/session/logs)
  -N, --dry-run         Do not compile the programs
  --language {kotlin,groovy,java}
                        Select specific language
  --max-type-params MAX_TYPE_PARAMS
                        Maximum number of type parameters to generate
  --max-depth MAX_DEPTH
                        Generate programs up to the given depth
  -P, --only-correctness-preserving-transformations
                        Use only correctness-preserving transformations
  --timeout TIMEOUT     Timeout for transformations (in seconds)
  --cast-numbers        Cast numeric constants to their actual type (this option is used to avoid re-occrrence of a specific Groovy bug)
  --disable-use-site-variance
                        Disable use-site variance
  --disable-contravariance-use-site
                        Disable contravariance in use-site variance
  --disable-bounded-type-parameters
                        Disable bounded type parameters
  --disable-parameterized-functions
                        Disable parameterized functions
```

## CLI Options

#### `--bugs` (Optional)

Set the directory to save the results of the testing session.

NOTE: The default directory is `$(pwd)/bugs`.

Example: `--bugs hephaestus-results`

#### `--name` (Optional)

Name of the current testing session.

NOTE: The default name is a randomly generated 5-character long string
(e.g., `hl43S`).

Example: `--name test-javac-1`

#### `--language`

When running `hephaestus`, you should specify which language's the compiler you
want to test. The available options are `kotlin`, `groovy`, and `java`.
Hephaestus will use the selected language's compiler that is on the `PATH`.
If you want to test a specific compiler version, you should configure it as
the current session's default compiler.

Example: `--language kotlin` -- `hephaestus` will test the Kotlin compiler
(i.e., `kotlinc`)

#### `--seconds` and `--iterations`

You should always specify either `--seconds` or `--iterations` option.
The former specifies how much time `hephaestus` should test a compiler in
seconds, whereas the second specifies how many test cases should `hephaestus`
generate and run.

Example 1: `--seconds 120` -- `hephaestus` will run for 2 minutes.

Example 2: `--iterations 60` -- `hephaestus` will generate and run 60 test
programs.

#### `--batch` (Optional)

When running `hephaestus`, most of the testing time is spent compiling the test
programs. Instead of generating one program at a time, you can specify the
number of programs you want to generate and the compiling all of them as
a batch.

NOTE: The default option is 1.

Example: `--batch 30` -- First, create 30 programs and then compile them with
a single compiler execution.

#### `--workers` (Optional)

When `--batch` option is larger than one, you can specify the number of workers
that will generate and mutate programs in parallel.

NOTE: The default option is 1.

Example: `--workers 4` -- Use four workers to generate and mutate test
programs.

#### `--transformation-types` and `--only-correctness-preserving-transformations`

Hephaestus supports two transformations, those that produce well-typed test
programs and those that produce ill-typed test programs. Currently,
`hephaestus` implements Type Erasure Mutator (TEM) and Type Overwriting
Mutator (TOM). The former constructs well-typed programs,
while the latter yields ill-typed.

By default, TOM is always running after generating a test program.
To disable TOM, you should use the option
`--only-correctness-preserving-transformations`.
`--transformation-types` option specifies which mutations that produce
well-typed programs should be used during a testing session. Currently,
`hephaestus` implements only one mutator that produces well-typed programs
(i.e., TEM).

**Note**: Although you can use the mutators in combination, they have not been
rigorously tested in combination.

Example: `--transformation-types TypeErasure` -- enable TypeErasure mutation.

#### `--transformations` and `--transformation-schedule`

You should always specify one of those options. `--transformations` specify the
number of mutations that should be applied per test program. If the value is
`0`, `hephaestus` will run only the generator. Note that this option only
specifies how many correctness-preserving mutations should be applied.
`--transformation-schedule` expects a path for a file containing the schedule
of transformations. This file should specify a mutator per line.

Example 1: `--transformations 0` -- Do not perform any transformations.

Example 2: `--transformation-schedule transformations.txt` -- Perform the
transformations declared in file `transformations.txt`.
The `transformations.txt` file could contain the following.

```
TypeErasure
```

#### `--keep-all` (Optional)

`hephaestus` only saves programs that result in compiler bugs.
When `--keep-all` is enabled, `hephaestus` will save all generated and mutated
test programs regardless of whether they trigger compiler bugs or not.

Example: `--keep-all`

#### `--dry-run` (Optional)

When this option is used, `hephaestus` only produces and mutates test programs,
i.e., it does not invoke the compiler under test.

Example: `--dry-run`

#### `--log-file` (Optional)

By default, `hephaestus` keeps logs of a testing session in a file called `logs`,
which resides in the current working directory.
However, with `--log-file` option, you can specify
another file to save the logs.

Example: `--log-file my_logs`

#### `--replay` (Optional)

Use a seed program written in `hephaestus`' IR,
instead of invoking `hephaestus`' program generator.

**Note**: The input program should be pickled.

Example: `--replay bugs/idET7/generator/iter_1/Main.java.bin`

#### `--debug` (Debugging option)

Print debug messages before every step (i.e., program generation, mutation,
compilation).

**Note**: Use this option only when `--workers` option is set to 1
and `-batch` is set to 1.

Example: `--debug`

#### `--examine` (Debugging option)

Open a debugger session to inspect the IR of the generated program.

**Note**: This option can only be used with `--replay` option.

#### `--print-stacktrace` (Debugging option)

Print stacktaces when encountering `hephaestus` internal errors.

Example: `--print-stacktrace`

#### `--cast-numbers` (Optional)

This option is used to cast numeric constants to their actual type in Groovy
programs. We use this option to avoid the re-occurrence of a specific Groovy
bug.

**Note**: This option has an effect only when `--language` is set to `groovy`.

Example: `--cast-numbers`

#### `--disable-use-site-variance` (Optional)

Generate programs that do not use use-site variance.

Example: `--disable-use-site-variance`

#### `--disable-contravariance-use-site` (Optional)

Generate programs that do not use contravariance in use-site variance.

Example: `--disable-contravariance-use-site`


#### `--disable-parameterized-functions` (Optional)

Generate programs that do not declare parameterized functions.

Example: `--disable-parameterized-functions`

#### `--disable-bounded-type-parameters` (Optional)

Generate programs that do declare type parameters with upper bounds.

Example: `--disable-bounded-type-parameters`

#### `--max-type-params` (Optional)

Specify the maximum number of type parameters for a parameterized class
or a parameterized function.

**Note**: the default value is `3`.

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

## Example: Testing the Groovy compiler

Here, we will test the Groovy compiler by employing `hephaestus`' program
generator. Specifically, we will produce 30 test programs in batches of 10
test programs using two workers with the following command.
Our testing session is named `groovy-session`.

```
hephaestus@e0456a9b520e:~/hephaestus$ hephaestus.py \
    --language groovy --transformations 0 \
    --batch 10 --iterations 30 --workers 2 -P \
    --name groovy-session
```

The expected outcome is something like the following:

```
stop_cond             iterations (30)
transformations       0
transformation_types  TypeErasure
bugs                  /home/hephaestus/hephaestus/bugs
name                  groovy-session
language              groovy
compiler              Groovy compiler version 4.0.0
===============================================================================
Test Programs Passed 30 / 30 ✔          Test Programs Failed 0 / 30 ✘
```

Two files are generated inside `/home/hephaestus/bugs/groovy-session`:
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
    "name": "groovy-session",
    "language": "groovy",
    "compiler"  "Groovy compiler version 4.0.0"
  },
  "totals": {
    "passed": 30,
    "failed": 0
  }
}
```

If there were some bugs detected,
`faults.json` would look like the following JSON file.

```
{

  "3": {
    "transformations": [],
    "error": " 72: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 72, column 99.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 100: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 100, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 141: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 141, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 202: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 202, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 228: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 228, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 299: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 299, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 376: The type ? is not a valid substitute for the bounded parameter <Y extends java.lang.Short>\n @ line 376, column 44.\n   spoons(Sicken issued, Plumage<? super Sh\n                                 ^\n 393: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 393, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^\n 510: The type ? is not a valid substitute for the bounded parameter <F extends java.lang.Double>\n @ line 510, column 90.\n    extends Double> gifting(Door<? super Do\n                                 ^",
    "programs": {
      "/tmp/tmpt_x_l1wk/src/kettles/Main.groovy": true
    }
  },
  "11": {
    "transformations": [
        "TypeOverwriting"
    ],
    "error": "SHOULD NOT BE COMPILED: X <: N expected but Imagine <: (Playing<Function1<Boolean(groovy-builtin), Float(groovy-builtin)>>) found in node global/Reconcile/reflexes/soybeans/cellos",
    "programs": {
      "/tmp/tmpmtyy6u6q/src/spanners/Main.groovy": true,
      "/tmp/tmpmtyy6u6q/src/franker/Main.groovy": false
    }
  },
  "1050": {
    "transformations": [],
    "error": ">>> a serious error occurred: BUG! exception in phase 'instruction selection' in source unit '/tmp/tmphj006wfu/src/wack/Main.groovy' unexpected NullPointerException\n>>> stacktrace:\nBUG! exception in phase 'instruction selection' in source unit '/tmp/tmphj006wfu/src/wack/Main.groovy' unexpected NullPointerException\n\tat org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:905)\n\tat org.codehaus.groovy.control.CompilationUnit.processPhaseOperations(CompilationUnit.java:654)\n\tat org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:628)\n\tat org.codehaus.groovy.control.CompilationUnit.compile(CompilationUnit.java:609)\n\tat org.codehaus.groovy.tools.FileSystemCompiler.compile(FileSystemCompiler.java:311)\n\tat org.codehaus.groovy.tools.FileSystemCompiler.doCompilation(FileSystemCompiler.java:240)\n\tat org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompile(FileSystemCompiler.java:165)\n\tat org.codehaus.groovy.tools.FileSystemCompiler.commandLineCompileWithErrorHandling(FileSystemCompiler.java:205)\n\tat org.codehaus.groovy.tools.FileSystemCompiler.main(FileSystemCompiler.java:189)\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\n\tat org.codehaus.groovy.tools.GroovyStarter.rootLoader(GroovyStarter.java:112)\n\tat org.codehaus.groovy.tools.GroovyStarter.main(GroovyStarter.java:130)\nCaused by: java.lang.NullPointerException: Cannot invoke \"org.codehaus.groovy.ast.stmt.Statement.visit(org.codehaus.groovy.ast.GroovyCodeVisitor)\" because the return value of \"org.codehaus.groovy.ast.MethodNode.getCode()\" is null\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.isTypeSource(StaticTypeCheckingVisitor.java:4189)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.checkForTargetType(StaticTypeCheckingVisitor.java:4160)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitTernaryExpression(StaticTypeCheckingVisitor.java:4136)\n\tat org.codehaus.groovy.ast.expr.TernaryExpression.visit(TernaryExpression.java:44)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethodCallExpression(StaticTypeCheckingVisitor.java:3303)\n\tat org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethodCallExpression(StaticCompilationVisitor.java:421)\n\tat org.codehaus.groovy.ast.expr.MethodCallExpression.visit(MethodCallExpression.java:77)\n\tat org.codehaus.groovy.ast.CodeVisitorSupport.visitExpressionStatement(CodeVisitorSupport.java:117)\n\tat org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitExpressionStatement(ClassCodeVisitorSupport.java:204)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitExpressionStatement(StaticTypeCheckingVisitor.java:2188)\n\tat org.codehaus.groovy.ast.stmt.ExpressionStatement.visit(ExpressionStatement.java:41)\n\tat org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)\n\tat org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:168)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3895)\n\tat org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)\n\tat org.codehaus.groovy.ast.CodeVisitorSupport.visitBlockStatement(CodeVisitorSupport.java:86)\n\tat org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitBlockStatement(ClassCodeVisitorSupport.java:168)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitBlockStatement(StaticTypeCheckingVisitor.java:3895)\n\tat org.codehaus.groovy.ast.stmt.BlockStatement.visit(BlockStatement.java:70)\n\tat org.codehaus.groovy.ast.CodeVisitorSupport.visitClosureExpression(CodeVisitorSupport.java:239)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClosureExpression(StaticTypeCheckingVisitor.java:2402)\n\tat org.codehaus.groovy.ast.expr.ClosureExpression.visit(ClosureExpression.java:110)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitCastExpression(StaticTypeCheckingVisitor.java:4074)\n\tat org.codehaus.groovy.ast.expr.CastExpression.visit(CastExpression.java:96)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitInitialExpression(StaticTypeCheckingVisitor.java:1931)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitDefaultParameterArguments(StaticTypeCheckingVisitor.java:2616)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitConstructorOrMethod(StaticTypeCheckingVisitor.java:2588)\n\tat org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitMethod(ClassCodeVisitorSupport.java:110)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.startMethodInference(StaticTypeCheckingVisitor.java:2573)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitMethod(StaticTypeCheckingVisitor.java:2552)\n\tat org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitConstructorOrMethod(StaticCompilationVisitor.java:236)\n\tat org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitMethod(StaticCompilationVisitor.java:251)\n\tat org.codehaus.groovy.ast.ClassNode.visitMethods(ClassNode.java:1135)\n\tat org.codehaus.groovy.ast.ClassNode.visitContents(ClassNode.java:1128)\n\tat org.codehaus.groovy.ast.ClassCodeVisitorSupport.visitClass(ClassCodeVisitorSupport.java:52)\n\tat org.codehaus.groovy.transform.stc.StaticTypeCheckingVisitor.visitClass(StaticTypeCheckingVisitor.java:437)\n\tat org.codehaus.groovy.transform.sc.StaticCompilationVisitor.visitClass(StaticCompilationVisitor.java:197)\n\tat org.codehaus.groovy.transform.sc.StaticCompileTransformation.visit(StaticCompileTransformation.java:68)\n\tat org.codehaus.groovy.control.customizers.ASTTransformationCustomizer.call(ASTTransformationCustomizer.groovy:298)\n\tat org.codehaus.groovy.control.CompilationUnit$IPrimaryClassNodeOperation.doPhaseOperation(CompilationUnit.java:900)\n\t... 14 more\n",
    "programs": {
      "/tmp/tmphj006wfu/src/yarn/Main.groovy": true
    }
  }
}
```

The first error is an unexpected compile-time error detected using
our generator ([GROOVY-10153](https://issues.apache.org/jira/browse/GROOVY-10153)).
The second is a compiler bug where the compiler accepts
an ill-typed program ([GROOVY-10370](https://issues.apache.org/jira/browse/GROOVY-10370)).
Finally, the third one is an internal error of
`groovyc` ([GROOVY-10357](https://issues.apache.org/jira/browse/GROOVY-10357)).

In the above scenario,
the testing session directory (i.e., `bugs/groovy-session/`)
would be like the following:

```
|-- 7
|   |-- Main.groovy
|   `-- Main.groovy.bin
|-- 11
|   |-- incorrect.groovy
|   |-- incorrect.groovy.bin
|   |-- Main.groovy
|   `-- Main.groovy.bin
|-- 29
|   |-- Main.groovy
|   `-- Main.groovy.bin
|-- faults.json
`-- stats.json
```

Now, you can exit the Docker container by running:

```
hephaestus@e0456a9b520e:~$ exit
```

# Step By Step Instructions

To validate the main results presented in the paper, first create a new Docker
container by running:

```
docker run -ti --rm \
  -v $(pwd)/database:/home/hephaestus/database \
  -v $(pwd)/data:/home/hephaestus/data \
  -v $(pwd)/scripts:/home/hephaestus/eval-scripts \
  -v $(pwd)/figures:/home/hephaestus/eval-figures \
  hephaestus-eval
```

Note that we mount four local volumes inside the newly-created container.
The first volume (`database/`) contains the bug database that includes the bugs
discovered by our approach, while the second volume (`data/`) provides the data
collected during our evaluation. The third volume (`eval-scripts/`) includes
some scripts to reproduce and validate the results of the paper. Finally, the
fourth volume (`eval-figures/`) will be used to save Figure 8 of our paper.

## Bug Database

We provide an SQLite database (see the file `bugs/bugdb.sqlite3`) that contains
information about the bugs discovered by `Hephaestus` during the evaluation.
This database is initialized based on the SQL script stored into
`bugs/bug_schema.sql`. The bug database consists of three tables,
namely `CompilerBug`, `Characteristic`, and `CompilerBugCharacteristics`.

Each record of the `CompilerBug` table consists of the following columns.

* `bid`: A serial number corresponding to the ID of the bug.
* `bug_id`: The bug id as displayed in the corresponding issue tracker.
* `language`: The name of the programming language of the test program.
* `compiler`: The name of the compiler where the bug was found.
* `title`: The title of the bug report.
* `issue_tracker_link`: A URL pointing to the bug report opened by us.
* `mutator`: The component that detected the bug. There are four possible
values: generator, soundness (i.e., TOM), inference (i.e., TEM), and
inference/soundness (i.e., TEM and then TOM).
* `fix_link`: A URL pointing to the fix of the bug.
* `severity`: The severity of the bugs given by the developers.
* `status`: The status of the bug.
* `resolution`: The resolution of the bug (e.g., Fixed, Duplicate).
* `report_date`: The date that we reported the bug.
* `resolution_date`: The date that the developers resolved the bug.
* `symptom`: The symptom of the bug. There are three possible values:
unexpected compile-time error (UCTE), unexpected runtime behavior (URB),
and crash. Note that the URB symptom corresponds to soundness bugs detected by TOM.
* `resolved_in`: How long did it take to resolve this bug.
* `test`: The test program that revealed the bug.
* `error_msg`: The error message reported by the compiler, or the stacktrace of
the crash, or the exception caused in the runtime.

The `Characteristic` table contains the following three fields.

* `cid`: A serial number corresponding to the ID of the characteristic.
* `characteristic_name`: The name of the characteristic
(e.g., Parameterized class).
* `category`: The category of the characteristic
(e.g. Parametric polymorphism).

Finally, `CompilerBugCharacteristics` is a table implementing the many-to-many
relationship between `CompilerBug` and `CompilerBugCharacteristics`,
this table contains three fields: `bcid`, `cid`, `bid`.

### Example Queries

From inside the container, we can perform some basic queries on this bug
database.

Get the total number of the discovered bugs.

```
hephaestus@e0456a9b520e:~$ sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug";
153
```

Find the number of `groovyc` bugs.

```
hephaestus@e0456a9b520e:~$ sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug WHERE compiler = 'groovyc'";
110
```

Find the number of `javac` bugs that have UCTE as their symptom.

```
hephaestus@e0456a9b520e:~$ sqlite3 database/bugdb.sqlite3 "SELECT COUNT(*) FROM CompilerBug WHERE compiler = 'javac' AND symptom = 'Unexpected Compile-Time Error'";
7
```

For each Kotlin bug revealed by TEM (i.e., type erasure mutation), dump the URLs
pointing to our bug reports.

```
hephaestus@e0456a9b520e:~$ sqlite3 database/bugdb.sqlite3 "SELECT issue_tracker_link FROM CompilerBug WHERE compiler = 'kotlinc' AND mutator = 'inference'";
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

Get the three most common characteristics used in the test cases of the
reported bugs.

```
hephaestus@e0456a9b520e:~$ sqlite3 database/bugdb.sqlite3 "SELECT c.characteristic_name, COUNT(*) as total FROM CompilerBugCharacteristics as cbc JOIN Characteristic as c ON c.cid = cbc.cid GROUP BY cbc.cid ORDER BY total DESC LIMIT 3";
Parameterized class|96
Parameterized type|77
Bounded type parameter|50
```

## RQ1: Bug-Finding Results (Section 4.2)

For the first research question, first, we will use `database/bugs.json` to
reproduce Figure 7a, which shows how many bugs (and their status) were found in
each tested compiler. To do so, run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/process_bugs.py database/bugs.json rq1
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

Next, run the following script to produce Figure 8 and compute the numbers of
**"Affected compiler versions"** paragraph.

```
hephaestus@e0456a9b520e:~$ python eval-scripts/history_analysis.py \
    data/history/history_19_11_21.json eval-figures/bug_versions.pdf
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

This script will also generate Figure 8 and save it at
`figures/bug_versions.pdf` in your host machine.

The statements that we want to check from paragraph
**"Affected compiler versions"** are the following:

* _"35 `groovyc` and 14 `kotlinc` bugs occur in all stable compiler versions"_.
* _"A large portion of `groovyc` bugs (50/110 -- 45%) are triggered only in
the master branch of the compiler_".

### Re-run the "Affected Compiler Versions" experiment. (Optional)

To re-compute which compiler versions are affected, you can run the following
command (it will take around 90 minutes):

```
python scripts/history_run.py database/bugs.json history.json
```

**Note**: The results might be slightly different because
(1) some compiler version might be no longer supported by SDKMAN,
(2) the developers may have fixed some bugs.


## RQ2: Bug and Test Case Characteristics (Section 4.3)

For the second research question, we will use `database/bugs.json` to reproduce
Figure 7b, which shows the symptoms of the reported bugs. Furthermore, we will
find the most popular features used in the bug-revealing test programs.
To do so, run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/process_bugs.py database/bugs.json rq2
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

Beyond Figure 7b, this script produces the numbers mentioned in Section 4.3.
Specifically, Section 4.3 contains the following statements:

* _"Features related to parametric polymorphism (e.g., parameterized class) are
in the list of features with the most bug-revealing capability_".
* _"In total, 104/153 bugs are caused by programs containing at least one such
feature (parametric polymorphism)_".
* _"In 47% of test cases that use conditionals, type inference features are
also included_".

To verify the last statement, you can use the option `--combinations`
and see which features are used with conditionals (i.e.,
15 out of 32 programs that use conditionals,
they also involve type inference).

```
hephaestus@e0456a9b520e:~$ python eval-scripts/process_bugs.py --combinations \
    database/bugs.json rq2
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

For the third research question, we will first use `database/bugs.json` to
reproduce Figure 7c, which shows how many bugs each component revealed.
To do so, run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/process_bugs.py database/bugs.json rq3
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
In the `data/coverage/mutations/` directory, we provide the results of JaCoCo
on 5k random test programs per compiler saved at `data/test_programs/mutations`.

### `groovyc`

For computing the impact of TEM on code coverage,
run

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/groovy/groovy-generator-inf.csv \
    data/coverage/mutations/groovy/groovy-combination-inf.csv \
    data/coverage/mutations/groovy/groovy_whitelist --increasepkg
```

This script will produce the following output:

```
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           42.68              41.77              42.07
Combination                       43.14              42.14              42.52
% change                           0.46               0.37               0.45
Absolute change                     167                 27                752

org.codehaus.groovy.control.messages: Branch -- 44 (66.67), Line -- 12 (70.59), Func -- 3 (75.00)
org.codehaus.groovy.transform.stc: Branch -- 531 (4.58), Line -- 106 (4.25), Func -- 13 (3.58)
org.codehaus.groovy.transform: Branch -- 541 (4.05), Line -- 107 (3.69), Func -- 13 (3.04)
org.codehaus.groovy: Branch -- 722 (1.38), Line -- 158 (1.31), Func -- 26 (1.07)
org.codehaus: Branch -- 722 (1.38), Line -- 158 (1.31), Func -- 26 (1.07)
total: Branch -- 752 (1.07), Line -- 167 (1.09), Func -- 27 (0.87)
org: Branch -- 752 (1.07), Line -- 167 (1.09), Func -- 27 (0.87)
org.codehaus.groovy.control: Branch -- 76 (1.03), Line -- 22 (1.29), Func -- 6 (1.92)
org.codehaus.groovy.classgen.asm: Branch -- 48 (0.57), Line -- 15 (0.76), Func -- 3 (0.80)
org.codehaus.groovy.transform.sc: Branch -- 10 (0.57), Line -- 1 (0.25), Func -- 0 (0.00)
org.codehaus.groovy.ast: Branch -- 57 (0.54), Line -- 14 (0.56), Func -- 4 (0.50)
org.codehaus.groovy.classgen: Branch -- 48 (0.27), Line -- 15 (0.37), Func -- 3 (0.43)
org.codehaus.groovy.transform.sc.transformers: Branch -- 2 (0.22), Line -- 0 (0.00), Func -- 0 (0.00)
org.apache.groovy.parser.antlr4: Branch -- 30 (0.17), Line -- 9 (0.27), Func -- 1 (0.15)
org.apache.groovy.parser: Branch -- 30 (0.17), Line -- 9 (0.27), Func -- 1 (0.15)
org.apache.groovy: Branch -- 30 (0.17), Line -- 9 (0.27), Func -- 1 (0.15)
org.apache: Branch -- 30 (0.17), Line -- 9 (0.27), Func -- 1 (0.15)
org.codehaus.groovy.ast.expr: Branch -- 3 (0.16), Line -- 1 (0.19), Func -- 1 (0.49)
```

In the above output,
please notice line:
```
org.codehaus.groovy.transform.stc: Branch -- 531 (4.58), Line -- 106 (4.25), Func -- 13 (3.58)
```
This line presents the absolute and percentage increase
(shown inside parentheses) of branch,
line, and function coverage caused by TEM on package
`org.codehaus.groovy.transform.stc.*`.


Now, for computing the impact of TOM on code coverage,
run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/groovy/groovy-generator-sound.csv \
    data/coverage/mutations/groovy/groovy-combination-sound.csv \
    data/coverage/mutations/groovy/groovy_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           43.30              42.21              42.72
Combination                       43.57              42.35              42.99
% change                           0.27               0.14               0.27
Absolute change                      99                 10                447
```

### `kotlinc`

For computing the impact of TEM on code coverage,
run:
```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py k \
    data/coverage/mutations/kotlin/kotlin-generator-inf.csv \
    data/coverage/mutations/kotlin/kotlin-combination-inf.csv \
    data/coverage/mutations/kotlin/kotlin_whitelist --increasepkg
```
The above script will produce the following output:

```
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           30.92              30.60              30.32
Combination                       31.38              31.00              30.78
% change                           0.46               0.39               0.46
Absolute change                     787                217               5431

org.jetbrains.kotlin.resolve.calls.inference.constraintPosition: Branch -- 83 (73.45), Line -- 6 (54.55), Func -- 5 (100.00)
org.jetbrains.kotlin.resolve.typeBinding: Branch -- 136 (60.44), Line -- 16 (50.00), Func -- 6 (54.55)
org.jetbrains.kotlin.resolve.calls.inference: Branch -- 1865 (20.09), Line -- 238 (17.75), Func -- 63 (14.89)
org.jetbrains.kotlin.resolve.calls.tower: Branch -- 938 (10.98), Line -- 137 (10.69), Func -- 36 (10.98)
org.jetbrains.kotlin.resolve.calls.inference.model: Branch -- 202 (9.36), Line -- 23 (6.97), Func -- 10 (7.35)
org.jetbrains.kotlin.resolve.calls.inference.components: Branch -- 466 (8.50), Line -- 63 (7.91), Func -- 5 (2.50)
org.jetbrains.kotlin.resolve.calls: Branch -- 3402 (8.38), Line -- 476 (8.11), Func -- 119 (6.94)
org.jetbrains.kotlin.psi.psiUtil: Branch -- 59 (8.35), Line -- 10 (12.66), Func -- 2 (4.26)
org.jetbrains.kotlin.types: Branch -- 957 (4.32), Line -- 147 (4.47), Func -- 69 (6.48)
org.jetbrains.kotlin.resolve: Branch -- 4086 (4.17), Line -- 572 (3.93), Func -- 135 (3.33)
org.jetbrains.kotlin.resolve.calls.tasks: Branch -- 14 (4.11), Line -- 3 (5.66), Func -- 1 (3.85)
org.jetbrains.kotlin.resolve.constants.evaluate: Branch -- 125 (3.86), Line -- 22 (4.33), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.calls.components: Branch -- 218 (3.53), Line -- 32 (3.88), Func -- 6 (2.27)
org.jetbrains.kotlin.resolve.calls.model: Branch -- 80 (3.18), Line -- 11 (2.70), Func -- 9 (5.49)
org.jetbrains.kotlin.types.checker: Branch -- 127 (2.95), Line -- 16 (3.54), Func -- 7 (2.73)
org.jetbrains.kotlin.resolve.constants: Branch -- 138 (2.89), Line -- 23 (3.17), Func -- 1 (0.57)
org.jetbrains.kotlin.descriptors.annotations: Branch -- 33 (2.83), Line -- 6 (4.23), Func -- 2 (3.77)
org.jetbrains.kotlin.types.expressions: Branch -- 164 (2.28), Line -- 28 (2.16), Func -- 6 (2.18)
org.jetbrains.kotlin.resolve.descriptorUtil: Branch -- 15 (2.24), Line -- 1 (1.32), Func -- 1 (2.04)
org.jetbrains.kotlin.resolve.calls.util: Branch -- 10 (1.90), Line -- 1 (1.06), Func -- 1 (1.72)
org.jetbrains.kotlin.resolve.calls.smartcasts: Branch -- 46 (1.64), Line -- 5 (1.20), Func -- 1 (0.88)
total: Branch -- 5431 (1.52), Line -- 787 (1.48), Func -- 217 (1.29)
org.jetbrains.kotlin: Branch -- 5431 (1.52), Line -- 787 (1.48), Func -- 217 (1.29)
org.jetbrains: Branch -- 5431 (1.52), Line -- 787 (1.48), Func -- 217 (1.29)
org: Branch -- 5431 (1.52), Line -- 787 (1.48), Func -- 217 (1.29)
org.jetbrains.kotlin.psi: Branch -- 104 (1.43), Line -- 17 (1.27), Func -- 6 (0.90)
org.jetbrains.kotlin.diagnostics: Branch -- 92 (1.04), Line -- 15 (0.73), Func -- 4 (1.74)
org.jetbrains.kotlin.cli.jvm.compiler: Branch -- 40 (0.76), Line -- 7 (0.90), Func -- 1 (0.70)
org.jetbrains.kotlin.cfg: Branch -- 74 (0.64), Line -- 13 (0.72), Func -- 0 (0.00)
org.jetbrains.kotlin.parsing: Branch -- 31 (0.52), Line -- 9 (0.77), Func -- 0 (0.00)
org.jetbrains.kotlin.cli.jvm: Branch -- 44 (0.49), Line -- 8 (0.63), Func -- 1 (0.36)
org.jetbrains.kotlin.resolve.jvm: Branch -- 35 (0.44), Line -- 4 (0.31), Func -- 1 (0.33)
org.jetbrains.kotlin.cli.common.messages: Branch -- 5 (0.40), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.descriptors: Branch -- 33 (0.39), Line -- 6 (0.45), Func -- 2 (0.34)
org.jetbrains.kotlin.cli: Branch -- 49 (0.27), Line -- 8 (0.38), Func -- 1 (0.16)
org.jetbrains.kotlin.resolve.calls.checkers: Branch -- 6 (0.20), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.psi2ir.transformations: Branch -- 2 (0.14), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.calls.results: Branch -- 2 (0.13), Line -- 1 (0.40), Func -- 0 (0.00)
org.jetbrains.kotlin.diagnostics.rendering: Branch -- 5 (0.11), Line -- 1 (0.11), Func -- 1 (1.30)
org.jetbrains.kotlin.renderer: Branch -- 3 (0.07), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.jvm.checkers: Branch -- 2 (0.06), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.cli.common: Branch -- 5 (0.06), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.resolve.checkers: Branch -- 2 (0.05), Line -- 0 (0.00), Func -- 0 (0.00)
org.jetbrains.kotlin.psi2ir: Branch -- 2 (0.02), Line -- 0 (0.00), Func -- 0 (0.00)
```

In the above output,
please notice the following three lines:
```
org.jetbrains.kotlin.resolve.calls.inference: Branch -- 1865 (20.09), Line -- 238 (17.75), Func -- 63 (14.89)
org.jetbrains.kotlin.resolve: Branch -- 4086 (4.17), Line -- 572 (3.93), Func -- 135 (3.33)
org.jetbrains.kotlin.types: Branch -- 957 (4.32), Line -- 147 (4.47), Func -- 69 (6.48)
```
These lines present the absolute and percentage increase
(shown inside parentheses) of branch,
line, and function coverage caused by TEM on packages
`org.jetbrains.kotlin.resolve.calls.inference.*`,
`org.jetbrains.kotlin.resolve.*`,
and `org.jetbrains.kotlin.types.*` respectively.

For computing the impact of TOM on code coverage,
run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/kotlin/kotlin-generator-sound.csv \
    data/coverage/mutations/kotlin/kotlin-combination-sound.csv \
    data/coverage/mutations/kotlin/kotlin_whitelist

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           31.47              31.01              30.87
Combination                       31.80              31.31              31.22
% change                           0.33               0.30               0.35
Absolute change                     572                166               4171
```

### `javac`

For computing the impact of TEM on code coverage,
run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/java/java-generator-inf.csv \
    data/coverage/mutations/java/java-combination-inf.csv \
    data/coverage/mutations/java/java_whitelist --increasepkg
```
The above command will produce the following output:

```
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
```
In the above output,
please notice the following two lines:
```
com.sun.tools.javac.code: Branch -- 636 (3.27), Line -- 131 (3.31), Func -- 31 (3.16)
com.sun.tools.javac.comp: Branch -- 1200 (3.06), Line -- 204 (2.66), Func -- 47 (3.59)
```
These lines present the absolute and percentage increase
(shown inside parentheses) of branch,
line, and function coverage caused by TEM on packages
`com.sun.tools.javac.code.*`,
and `com.sun.tools.javac.comp.*`
respectively.

To see, the impact of TEM on the code coverage of classes instead of
packages, please run:

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/java/java-generator-inf.csv \
    data/coverage/mutations/java/java-combination-inf.csv \
    data/coverage/mutations/java/java_whitelist --increasecls
```

Now notice, the following lines, which presented in Figure 9.
```
com.sun.tools.javac.comp,Attr: Branch -- 295 (4.39), Line -- 57 (4.66), Func -- 10 (6.25)
com.sun.tools.javac.code,Types: Branch -- 558 (7.54), Line -- 113 (8.11), Func -- 23 (7.67)
```

Finally,
for computing the impact of TOM on `javac`'s code coverage,
run

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/mutations/java/java-generator-sound.csv \
    data/coverage/mutations/java/java-combination-sound.csv \
    data/coverage/mutations/java/java_whitelist

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           37.63              40.46              35.18
Combination                       38.26              41.19              35.76
% change                           0.62               0.74               0.57
Absolute change                     362                 79               1990
```

### Reproducing RQ3's Coverage Experiment (Optional)

Depending on your machine(s),
re-running the complete experiment could take up to 5 days.
Here, we will provide a complete example of how you
get the coverage of 10 Java test programs for both TEM and TOM, using JaCoCo.
To reproduce the full results, you should (1) produce 5k programs for both TOM
and TEM, and (2) run the same experiments for the other compilers by replacing
`java` with `groovy` and `kotlin` in the following commands.

#### Step 1: Generate the test programs.

The following command uses `Hephaestus` to generate 10 programs
written in Java using our program generator.
This command also produces a variant for each of those 10 programs
using TEM. Note that this command does not invoke the
compiler under test (see `--dry-run` option).

```
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name java_tem_10 --language java \
    --iterations 10 --batch 10 --workers 2 --transformations 1 \
    --keep-all --dry-run -P
```

The following command uses `Hephaestus` to generate 10 programs
written in Java using our program generator.
This command also produces a variant for each of those 10 programs
using TOM. Note that this command does not invoke the
compiler under test (see `--dry-run` option).

```
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name java_tom_10 --language java \
    --iterations 10 --batch 10 --workers 2 --transformations 0 \
    --keep-all --dry-run
```

#### Step 2: Produce the coverage reports for generator and TEM.

This command takes the programs generated in step 1,
and compiles them using `javac`.
This script first compiles the programs produced
by our program generator,
and tracks the code coverage of `javac`.
After that,
this script takes the TEM variants,
and compiles them using the instrumented version of `javac`.

```
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/java_mutations.sh \
    $HOME/coverage \
    $HOME/coverage_programs/java_tem_10/ 10 inference 2> /dev/null
```

#### Step 3: Compute the results for generator and TEM.

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py g \
    results/java/java-generator-inference.csv \
    results/java/java-comb-inference.csv \
    data/coverage/mutations/java/java_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           35.12              38.10              32.31
Combination                       35.55              38.66              32.74
% change                           0.43               0.56               0.43
Absolute change                     250                 60               1511
```

#### Step 4: Produce the coverage reports for generator and TOM.

This command takes the programs generated in Step 1,
and compiles them using `javac`.
This script first compiles the programs produced
by our program generator,
and tracks the code coverage of `javac`.
After that,
this script takes the TOM variants,
and compiles them using the instrumented version of `javac`.

```
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/java_mutations.sh \
    $HOME/coverage \
    $HOME/coverage_programs/java_tom_10/ 10 2> /dev/null
```

#### Step 5: Compute the results for generator and TOM.

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py g \
    results/java/java-generator-soundness.csv \
    results/java/java-comb-soundness.csv \
    data/coverage/mutations/java/java_whitelist

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           36.18              39.23              33.23
Combination                       36.64              39.86              34.19
% change                           0.45               0.63               0.96
Absolute change                     263                 68               3327
```

## RQ4: Code Coverage (Section 4.5)

For the fourth research question, we will use coverage data from
`data/coverage/compilers/` to reproduce Figure 10 that shows the code coverage
improvement when adding 10k programs produced by `Hephaestus` to the test
suites of each compiler. In the following, we compute the results per compiler.

### `groovyc`

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/compilers/groovy/groovy-vanilla.csv \
    data/coverage/compilers/groovy/groovy-hephaestus.csv \
    data/coverage/compilers/groovy/groovy_whitelist --compiler

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           82.00              71.77              78.38
Combination                       82.06              71.79              78.44
% change                           0.06               0.02               0.05
```

### `kotlinc`

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/compilers/kotlin/kotlin-vanilla.csv \
    data/coverage/compilers/kotlin/kotlin-hephaestus.csv \
    data/coverage/compilers/kotlin/kotlin_whitelist --compiler

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           80.80              72.99              74.08
Combination                       80.83              73.05              74.11
% change                           0.03               0.06               0.04
```

**Note**: Our results are slightly different from the submitted paper.
We will update Figure 10 on the camera-ready paper to match the results of
our artifact.


### `javac`

```
hephaestus@e0456a9b520e:~$ python eval-scripts/compute_coverage.py \
    g data/coverage/compilers/java/java-vanilla.csv \
    data/coverage/compilers/java/java-hephaestus.csv \
    data/coverage/compilers/java/java_whitelist --compiler

                          Line Coverage  Function Coverage    Branch Coverage
Initial                           83.76              83.95              83.90
Combination                       83.94              83.99              84.12
% change                           0.18               0.03               0.22
```

**Note**: Our results are slightly different from the submitted paper.
We will update Figure 10 on the camera-ready paper to match the results of
our artifact.

### Reproducing RQ4's Coverage Experiment (Optional)

Similar to RQ3,
re-running the full experiments for this RQ might take days.
These experiments require much time because you have to
run the test-suites of the compilers to produce their code coverage.
Note that if you run the experiments with a small number of generated test
programs, the code coverage increase should be minimal.

#### Java, Kotlin

`javac` does not provide any script to generate code coverage metrics for
its test-suite. Hence, we are going to compile
every program in the test-suite using an
instrumented version of `javac` to get the code coverage metrics
of `javac`'s test suite.

To compute the code coverage metrics of `javac's` test suite,
run:

```bash
# This will generate a code coverage report for the test-suite in
# results/java_test_suite/java-test-suite.csv
# It will take around 4 hours.
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/java_test_suite.sh
```


To generate Java programs using `Hephaestus`,
run the following commands. Note
that these commands generate 10 Java programs using TEM,
and 10 Java programs using TOM.

```
# You can skip this step if you have already generated some programs
# and their reports.
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name java_tem_10 --language java \
    --iterations 10 --batch 10 --workers 2 --transformations 1 \
    --keep-all --dry-run -P
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name java_tom_10 --language java \
    --iterations 10 --batch 10 --workers 2 --transformations 0 \
    --keep-all --dry-run
```

Compute code coverage metrics using the `Hephaestus` programs
generated previously:

```
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/java_mutations.sh \
    $HOME/coverage \
    $HOME/coverage_programs/java_tom_10/ 10 2> /dev/null
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/java_mutations.sh \
    $HOME/coverage \
    $HOME/coverage_programs/java_tem_10/ 10 inference 2> /dev/null
```

Combine the code coverage reports

```
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/combine.sh java \
    results/java/jacoco-comb-inference.exec \
    results/java/jacoco-comb-soundness.exec \
    results/java java-comb
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/combine.sh java \
    results/java-test-suite/jacoco.exec \
    results/java/java-comb.exec \
    results/java java-hephaestus
```

Print results

```
hephaestus@e0456a9b520e:~$ python ~/eval-scripts/compute_coverage.py g \
    results/java-test-suite/java-test-suite.csv \
    results/java/java-hephaestus.csv \
    ~/data/coverage/compilers/java/java_whitelist
                          Line Coverage  Function Coverage    Branch Coverage
Initial                           82.84              83.09              83.07
Combination                       82.89              83.09              83.13
% change                           0.06               0.00               0.06
Absolute change                      13                  0                 75
```

Similar to `javac`, `kotlinc` does not provide any script to generate code
coverage metrics for its test-suite. Hence, we are going to compile
every program in the test-suite
with an instrumented version of `kotlinc` to compute the
code coverage of its test-suite.

You can perform the experiments by changing `java` to `kotlin` in the previous
commands. Note that it would take up to 30 hours to compute the code coverage
for Kotlin's test-suite.


### Groovy

The build scripts of `groovyc` provide a command to generate code coverage
reports; thus, we will use it instead of compiling
each program in the test-suite individually with an
instrumented compiler (This will take around 2 hours).

```bash
hephaestus@e0456a9b520e:~$ sdk default use sdk use java 11.0.2-open
# Produce code coverage report for the test-suite of groovyc
hephaestus@e0456a9b520e:~$ cd ~/coverage/groovy
hephaestus@e0456a9b520e:~/coverage/groovy$ ./gradlew clean jacocoAllReport
hephaestus@e0456a9b520e:~/coverage/groovy$ cp build/jacoco/test.exec vanilla.exec
hephaestus@e0456a9b520e:~/coverage/groovy$ java \
    -jar $HOME/coverage/jacoco/lib/jacococli.jar report vanilla.exec \
    --classfiles $HOME/coverage/groovy/build/classes \
    --html vanilla --csv groovy-vanilla.csv
hephaestus@e0456a9b520e:~/coverage/groovy$ cd $HOME
```

To generate Groovy programs using `Hephaestus`,
run the following commands. Note
that these commands generate 10 Groovy programs using TEM,
and 10 Groovy programs using TOM.

```bash
# You can skip this step if you have already generated some Groovy programs
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name groovy_tem_10 --language groovy \
    --iterations 10 --batch 10 --workers 2 --transformations 1 \
    --keep-all --dry-run -P
hephaestus@e0456a9b520e:~$ hephaestus.py --bugs coverage_programs \
    --name groovy_tom_10 --language groovy \
    --iterations 10 --batch 10 --workers 2 --transformations 0 \
    --keep-all --dry-run
```

Replace bug directories

```bash
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/groovy-create-test-class.sh \
    $HOME/coverage \
    coverage_programs/groovy_tom_10/generator/ GeneratorSTCTest
hephaestus@e0456a9b520e:~$ ./eval-scripts/coverage/groovy-create-test-class.sh \
    $HOME/coverage \
    coverage_programs/groovy_tem_10/transformations/ InferenceSTCTest 0
```


Produce code coverage report for the test-suite of groovyc + the generated
test cases by `Hephaestus`

```bash
hephaestus@e0456a9b520e:~$ cd ~/coverage/groovy
hephaestus@e0456a9b520e:~/coverage/groovy$ ./gradlew clean jacocoAllReport
hephaestus@e0456a9b520e:~/coverage/groovy$ cp build/jacoco/test.exec hephaestus.exec
hephaestus@e0456a9b520e:~/coverage/groovy$ java \
    -jar $HOME/coverage/jacoco/lib/jacococli.jar report hephaestus.exec \
    --classfiles $HOME/coverage/groovy/build/classes \
    --html hephaestus --csv groovy-hephaestus.csv
```

Print results

```bash
hephaestus@e0456a9b520e:~/coverage/groovy$ python ~/eval-scripts/compute_coverage.py \
    g groovy-vanilla.csv \
    groovy-hephaestus.csv \
    $HOME/data/coverage/compilers/groovy/groovy_whitelist
Line Coverage  Function Coverage    Branch Coverage
Initial                           81.98              71.86              78.52
Combination                       82.06              71.95              78.58
% change                           0.08               0.09               0.06
Absolute change                     129                 40                736
```
