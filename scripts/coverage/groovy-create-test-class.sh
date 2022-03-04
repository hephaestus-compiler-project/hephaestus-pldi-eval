#!/bin/bash
if [ $# -lt 3 ]; then
    echo $0: usage: groovy-create-test-class.sh coverage_directory programs_directory cls_name [directory]
    echo $0: example: groovy-create-test-class.sh /home/user/coverage /home/user/bugs/cad1g/generator GeneratorSTCTest
    echo $0: example: groovy-create-test-class.sh /home/user/coverage /home/user/bugs/cad1g/transformations InferenceSTCTest 0
    exit 1
fi

COVERAGE=$1
PROGRAMS=$2
CLS_NAME=$3
DIRECTORY=$4

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     distro=Linux;;
    Darwin*)    distro=Mac;;
    *)          echo "$unameOut: is not supported" && exit 1
esac

source $HOME/eval-scripts/coverage/config.sh $distro $COVERAGE
OUTPUT=$COVERAGE/groovy/src/test/groovy/transform/stc/

BEGIN='''
package groovy.transform.stc\n\n
class NAME extends StaticTypeCheckingTestCase { \n
'''

read -r -d '' METHOD_START << EOM
\n\tvoid testNUM() { \n
\t\tassertClass ''' \n
EOM

read -r -d '' METHOD_END << EOM
\n\t\t'''\n
\t}\n
EOM

END='''
\n}
'''

counter=0
for i in $(ls $PROGRAMS/*/$DIRECTORY/Main.groovy); do
    if ! ((counter % 10)); then
        echo $counter
        current_cls="$CLS_NAME$counter"
        current_cls_file="$OUTPUT/$current_cls.groovy"
        begin=$(sed "s/NAME/$current_cls/" <<< "$BEGIN")
        echo -e $begin > $current_cls_file
    fi
    tmp=$(echo $i | sed "s/\/$DIRECTORY//")
    tmp=$(dirname $tmp)
    tmp=$(basename $tmp)
    number=${tmp#*_}
    code=$(sed "s/NUM/$number/" <<< "$METHOD_START")
    echo -e $code >> $current_cls_file
    cat $i >> $current_cls_file
    echo -e $METHOD_END >> $current_cls_file
    counter=$(( counter + 1 ))
done


counter=0
for i in $(ls $PROGRAMS/*/$DIRECTORY/Main.groovy); do
    if ! ((counter % 10)); then
        current_cls="$CLS_NAME$counter"
        current_cls_file="$OUTPUT/$current_cls.groovy"
        echo -e $END >> $current_cls_file
    fi
    counter=$(( counter + 1 ))
done
