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

### `--language`

When running `hephaestus` you should specify which language's the compiler you want to test. The available options are `kotlin`, `groovy`, and `java`. Hephaestus will use the selected language's compiler that is on the `PATH`. If you want to test a specific compiler version, you should configure it as the current session's default compiler.

Example: `--language kotlin`

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
