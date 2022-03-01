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
  * [Reproducing the Two Motivating Examples](#reproducing-the-two-motivating-examples)
  * [Simple Query of the Reported Bugs](#simply-query-of-the-reported-bugs)
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
the schema defined in `bugs/bug_schema.sql`.
* `example_bugs/`: Contains the test programs that trigger the two compiler 
bugs demonstrated in Section II of our paper.
* `hephaestus/`: Contains the source code of the tool 
(provided as a git submodule) used in our paper for testing the compilers of 
Java, Kotlin, and Groovy.
* `installation_scripts/`: Contains helper scripts used to install all
dependencies (e.g. compiler versions from SDKMAN).

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
hephaestus.py -h
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

## `--transformation-types` (Optional)

This option specifies which mutations can be used during a testing session. There are two option: `TypeErasure` and `TypeOverwriting`. If this option is not specified, `hephaestus` will run only the program generator. Although you can use the mutators in combination, they have not been rigorously tested.

* Example: `--transformation-types TypeErasure` -- enable TypeErasure mutation.

## `--transformations` and `--transformation-schedule`

You should always specify one of those options. `--transformations` specify the number of mutations that should be applied per test program. If the value is `0`, `hephaestus` will run only the generator. Note that the expected value of this option is between `0`, `1`, or `2`. 

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
cd hephaestus
# Run tests
python setup.py test
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

## Reproducing the Two Motivating Examples

### Reproducing the Groovy Bug

### Reproducing the Kotlin Bug

## Simple Query of the Reported Bugs

# Step By Step Instructions

## Bug Database

## RQ1: Bug-Finding Results (Section 4.2)

## RQ2: Bug and Test Case Characteristics (Section 4.3)

## RQ3: Effectiveness of Mutations (Section 4.4)

## RQ4: Code Coverage (Section 4.5)
