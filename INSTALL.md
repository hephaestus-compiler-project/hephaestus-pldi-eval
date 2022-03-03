To get the artifact, run:

```
git clone --recursive https://github.com/hephaestus-compiler-project/hephaestus-pldi-eval.git hephaestus-pldi-eval
```

The easiest way to get Hephaestus and all dependencies needed for evaluating 
the artifact (e.g., javac, kotlinc, jacoco) is to download a pre-built Docker 
image from DockerHub. Another option is to build the Docker 
image locally, or to try installing all dependencies on your machine 
(not recommended).

Docker Image
============

We provide a `Dockerfile` to build images that contain:

* An installation of Python (version 3.9.10).
* An installation of [SDKMAN](https://sdkman.io/).
* An installation of all OpenJDK Java versions form version `8` to version
`18.35` available on SDKMAN.
* An installation of the latest `javac` compiler.
* An installation of all Kotlin versions up to version `1.5.31` available on 
SDKMAN.
* An installation of all Groovy versions up to version `4.0.0` available 
on SDKMAN.
* An installation of the latest `groovyc` compiler.
* An installation of the `JaCoCo` Java code coverage library.
* An installation of `Hephaestus`.
* A user named `hephaestus` with sudo privileges.
* Python packages for creating figures (i.e., `seaborn`, `pandas`, 
and `matplotlib`)

Pull Docker Image from DockerHub
--------------------------------

You can download the Docker image from DockerHub by using the following 
commands:

```
docker pull schaliasos/hephaestus-eval
# Rename the image to be consistent with our scripts
docker tag schaliasos/hephaestus-eval hephaestus-eval
```

After downloading the Docker image successfully, 
please navigate to the root directory of the artifact:

```
cd hephaestus-eval
```

Build Docker Image Locally
--------------------------

First enter the `hephaestus-eval/` directory:

```
cd hephaestus-eval
```

To build the image (named `hephaestus-eval`), run the following command 
(estimated running time: 1 hour - 3 hours, depending on your internet 
connection):

```
docker build -t hephaestus-eval --no-cache .
```

NOTE: The image is built upon `ubuntu:18.04`.

Local Installation
==================

**Note that SDKMAN may provide different versions of a compiler based on
your operating system. Consequently, some experiments may produce slightly 
different results.**

### Dependencies

You need to download the following software packages:

* [SDKMAN](https://sdkman.io/)
* Python version 3.9.10.
* The following python packages:

```
pip setuptools distlib seaborn pandas matplotlib
```

* The following system packages (the names here are provided as given in 
the APT repository of Ubuntu.

```
software-properties-common git curl unzip zip python3.9-distutils sqlite3
python3-pydot python-pydot-ng graphviz autoconf build-essential gcc
libx11-dev libxext-dev libxrender-dev libxrandr-dev libxtst-dev libxt-dev 
libcups2-dev libfontconfig1-dev libcups2-dev libasound2-dev
```

### Compilers

Using SDKMAN, we are going to install all needed compiler versions.

```
./installation_scripts/install_java.sh
./installation_scripts/install_groovy.sh
./installation_scripts/install_kotlin.sh
```


### Code Coverage Software

You will need to install the latest version of `groovyc` and `javac`.
Furthemore, you will need to download the source code of `kotlinc`,
and install `jacoco`.

```
mkdir -p coverage
cd coverage
```

* Install `groovyc`.

```
source ${HOME}/.sdkman/bin/sdkman-init.sh
# Or any version of Java 11 available intro your system.
sdk use java 11.0.2-open 
git clone https://github.com/apache/groovy.git
cd groovy
git checkout 538374a1799947912496bf3a9aa8590cf5e38a75
# Or gradle instead of gradlew depending on your operating system.
./gradlew -p bootstrap && ./gradlew clean dist
cd ..
```

* Install `javac`.

```
source ${HOME}/.sdkman/bin/sdkman-init.sh
git clone https://github.com/openjdk/jdk.git
cd jdk
git checkout c79a485f1c3f9c0c3a79b8847fdcd50a141cd529
sdk use java 17.0.2-open
bash configure
make jdk
cd ..
```

* Download `kotlinc`.

```
source ${HOME}/.sdkman/bin/sdkman-init.sh
sdk install java 8.0.265-open
git clone https://github.com/JetBrains/kotlin.git
cd kotlin
git checkout 3ccbd25856ccfc3942a563e4833d87c7d5865c7f
cd ..
```

* Install `jacoco`.

```
mkdir jacoco
cd jacoco
wget https://search.maven.org/remotecontent\?filepath\=org/jacoco/jacoco/0.8.7/jacoco-0.8.7.zip \
    -O jacoco-0.8.7.zip
unzip jacoco-0.8.7.zip
cd ../../
```
