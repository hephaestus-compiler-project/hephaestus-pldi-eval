To get the artifact, run:

```
git clone --recursive https://github.com/hephaestus-compiler-project/hephaestus-pldi-eval.git hephaestus-pldi-eval
```

The easiest way to get `Hephaestus` and all dependencies needed for the artifact
(e.g. `javac`, `kotlinc`, `jacoco`) is to download a pre-build Docker image
from Github's container registry. Another option is to build the Docker image 
locally, or to try installing all dependencies on your machine (not recommended).

Docker Image
============

We provide a `Dockerfile` to build images that contain:

* An installation of Python (version 3.9.10).
* An installation of [SDKMAN](https://sdkman.io/).
* An installation of all OpenJDK Java versions form version `11` to version
`18.15` available on SDKMAN.
* An installation of all Kotlin versions until version `1.5.31` available on 
SDKMAN.
* An installation of all Groovy versions until version `4.0.0-beta-1` available 
on SDKMAN.
* An installation of `Hephaestus`.
* A user named `hephaestus` with sudo privileges.
* Python packages for creating figures (i.e., `seaborn`, `pandas`, 
and `matplotlib`)

Pull Docker Image from Github's Container Registry
--------------------------------------------------

You can also download the Docker image from Github's container regirst
by using the following commands:

```
docker pull ghcr.io/hephaestus-compiler-project/hephaestus-eval
# Rename the image to be consistent with our scripts
docker tag hephaestus-compiler-project/hephaestus-eval hephaestus-eval
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
(estimated running time: 30 minutes - 1 hour):

```
docker build -t hephaestus-eval --no-cache .
```

NOTE: The image is built upon `ubuntu:18.04`.

Local Installation
==================

**Note that SDKMAN may provide different versions of a compiler based on
your operating system. Consequently, some experiments may produce slightly 
different results.**
