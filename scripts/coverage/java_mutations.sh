#!/bin/bash
if [ $# -lt 3 ]; then
    echo $0: usage: java.sh coverage_directory programs_directory nr_programs [inference]
    echo $0: example: java.sh /home/user/coverage /home/user/bugs/cad1g 999 inference
    echo $0: example: java.sh /home/user/coverage /home/user/bugs/cad1g 999
    exit 1
fi

COVERAGE=$1
PROGRAMS=$2
NR=$3
INFERENCE=$4

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
GENERATOR=$PROGRAMS/generator
STEP=5

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     distro=Linux;;
    Darwin*)    distro=Mac;;
    *)          echo "$unameOut: is not supported" && exit 1
esac

source $SCRIPT_DIR/config.sh $distro $COVERAGE

if [[ -z $INFERENCE ]]; then
    MUTANT=soundness
    MUTANT_PROGRAMS=$PROGRAMS/generator
else
    MUTANT=inference
    MUTANT_PROGRAMS=$PROGRAMS/transformations
fi

RES=results/java
mkdir -p $RES
cd $RES
RES=$(pwd)
cd ..

GENERATOR_RES=$RES/generator
MUTANT_RES=$RES/$MUTANT
mkdir -p $GENERATOR_RES
mkdir -p $MUTANT_RES

run_javac () {
    first=$1
    last=$2
    res=$3
    name=$4
    p=$5
    for iter in $(seq $first 1 $last); do
        t=iter_$iter/$p/$name
        $JAVA_17 -javaagent:$JACOCO/lib/jacocoagent.jar=destfile=$res/jacoco-$iter.exec \
            -XX:+UseSerialGC -Xms32M -Xmx512M -XX:TieredStopAtLevel=1 \
            -XX:+UnlockDiagnosticVMOptions -XX:-VerifySharedSpaces -Xshare:auto \
            -XX:SharedArchiveFile=$JAVA_SRC/build/$JAVA_BUILD/configure-support/classes.jsa \
            --limit-modules java.base,jdk.zipfs,java.compiler.interim,jdk.compiler.interim,jdk.javadoc.interim \
            --add-modules java.compiler.interim,jdk.compiler.interim,jdk.javadoc.interim \
            --module-path $JAVA_SRC/build/$JAVA_BUILD/buildtools/interim_langtools_modules \
            --patch-module java.base=$JAVA_SRC/build/$JAVA_BUILD/buildtools/gensrc/java.base.interim \
            --add-exports java.base/sun.reflect.annotation=jdk.compiler.interim \
            --add-exports java.base/jdk.internal.jmod=jdk.compiler.interim \
            --add-exports java.base/jdk.internal.misc=jdk.compiler.interim \
            --add-exports java.base/sun.invoke.util=jdk.compiler.interim \
            --add-exports java.base/jdk.internal.javac=java.compiler.interim \
            --add-exports java.base/jdk.internal.javac=jdk.compiler.interim \
            -m jdk.compiler.interim/com.sun.tools.javac.Main -nowarn $t
    done
}

# Generator
cd $GENERATOR
i=1
for counter in $(seq $STEP $STEP $NR); do
    echo $i $counter
    run_javac $i $counter $GENERATOR_RES Main.java
    i=$counter
done

i=1
if [[ -z $INFERENCE ]]; then
    cd $MUTANT_PROGRAMS
    for counter in $(seq $STEP $STEP $NR); do
        echo $i $counter
        run_javac $i $counter $MUTANT_RES Incorrect.java
        i=$counter
    done
else
    cd $MUTANT_PROGRAMS
    for counter in $(seq $STEP $STEP $NR); do
        echo $i $counter
        run_javac $i $counter $MUTANT_RES Main.java 0
        i=$counter
    done
fi

cd $MUTANT_RES
$JAVA_17 -jar $JACOCO/lib/jacococli.jar merge jacoco-*.exec --destfile jacoco.exec
$JAVA_17 -jar $JACOCO/lib/jacococli.jar report jacoco.exec \
    --classfiles $JAVA_SRC/build/$JAVA_BUILD/buildtools/interim_langtools_modules/jdk.compiler.interim/com/sun/tools/javac/ \
    --csv java-$MUTANT.csv
cp java-$MUTANT.csv $RES
cp jacoco.exec $RES/jacoco-$MUTANT.exec
cd $GENERATOR_RES
$JAVA_17 -jar $JACOCO/lib/jacococli.jar merge jacoco-*.exec --destfile jacoco.exec
$JAVA_17 -jar $JACOCO/lib/jacococli.jar report jacoco.exec \
    --classfiles $JAVA_SRC/build/$JAVA_BUILD/buildtools/interim_langtools_modules/jdk.compiler.interim/com/sun/tools/javac/ \
    --csv java-generator-$MUTANT.csv
cp java-generator-$MUTANT.csv $RES
cp jacoco.exec $RES/jacoco-gen-$MUTANT.exec
# Merge
cd $RES
$JAVA_17 -jar $JACOCO/lib/jacococli.jar merge jacoco-$MUTANT.exec jacoco-gen-$MUTANT.exec \
    --destfile jacoco-comb-$MUTANT.exec
$JAVA_17 -jar $JACOCO/lib/jacococli.jar report jacoco-comb-$MUTANT.exec \
    --classfiles $JAVA_SRC/build/$JAVA_BUILD/buildtools/interim_langtools_modules/jdk.compiler.interim/com/sun/tools/javac/ \
    --csv java-comb-$MUTANT.csv
