#!/bin/bash
if [ $# -lt 3 ]; then
    echo $0: usage: groovy.sh coverage_directory programs_directory nr_programs [inference]
    echo $0: example: groovy.sh /home/user/coverage /home/user/bugs/cad1g 999 inference
    echo $0: example: groovy.sh /home/user/coverage /home/user/bugs/cad1g 999
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

RES=results/groovy
mkdir -p $RES
cd $RES
RES=$(pwd)
cd ..

GENERATOR_RES=$RES/generator
MUTANT_RES=$RES/$MUTANT
mkdir -p $GENERATOR_RES
mkdir -p $MUTANT_RES

run_groovyc () {
    first=$1
    last=$2
    res=$3
    name=$4
    p=$5
    for iter in $(seq $first 1 $last); do
        t=iter_$iter/$p/$name
        $JAVA_11 -javaagent:$JACOCO/lib/jacocoagent.jar=destfile=$res/jacoco-$iter.exec \
            -cp $GROOVY_SRC/build/libs/groovy-4.0.0-SNAPSHOT.jar \
            org.codehaus.groovy.tools.FileSystemCompiler --compile-static $t
    done
}

# Generator
cd $GENERATOR
i=1
for counter in $(seq $STEP $STEP $NR); do
    echo $i $counter
    run_groovyc $i $counter $GENERATOR_RES Main.groovy
    i=$counter
done

i=1
if [[ -z $INFERENCE ]]; then
    cd $MUTANT_PROGRAMS
    for counter in $(seq $STEP $STEP $NR); do
        echo $i $counter
        run_groovyc $i $counter $MUTANT_RES incorrect.groovy
        i=$counter
    done
else
    cd $MUTANT_PROGRAMS
    for counter in $(seq $STEP $STEP $NR); do
        echo $i $counter
        run_groovyc $i $counter $MUTANT_RES Main.groovy 0
        i=$counter
    done
fi

cd $MUTANT_RES
$JAVA_11 -jar $JACOCO/lib/jacococli.jar merge jacoco-*.exec --destfile jacoco.exec
$JAVA_11 -jar $JACOCO/lib/jacococli.jar report jacoco.exec \
    --classfiles $GROOVY_SRC/build/libs/groovy-4.0.0-SNAPSHOT.jar \
    --csv groovy-$MUTANT.csv
cp groovy-$MUTANT.csv $RES
cp jacoco.exec $RES/jacoco-$MUTANT.exec
cd $GENERATOR_RES
$JAVA_11 -jar $JACOCO/lib/jacococli.jar merge jacoco-*.exec --destfile jacoco.exec
$JAVA_11 -jar $JACOCO/lib/jacococli.jar report jacoco.exec \
    --classfiles $GROOVY_SRC/build/libs/groovy-4.0.0-SNAPSHOT.jar \
    --csv groovy-generator-$MUTANT.csv
cp groovy-generator-$MUTANT.csv $RES
cp jacoco.exec $RES/jacoco-gen-$MUTANT.exec
# Merge
cd $RES
java -jar $JACOCO/lib/jacococli.jar merge jacoco-$MUTANT.exec jacoco-gen-$MUTANT.exec \
    --destfile jacoco-comb-$MUTANT.exec
$JAVA_11 -jar $JACOCO/lib/jacococli.jar report jacoco-comb-$MUTANT.exec \
    --classfiles $GROOVY_SRC/build/libs/groovy-4.0.0-SNAPSHOT.jar \
    --csv groovy-comb-$MUTANT.csv
