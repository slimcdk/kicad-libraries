#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

SYMBOL_DIR=$SCRIPTPATH'/../symbols'
FOOTPRINTS_DIR=$SCRIPTPATH'/../footprints'
PACKAGES_DIR=$SCRIPTPATH'/../3d-packages'



function create_footprint {
    fp_dir=$FOOTPRINTS_DIR/${libname^}'.pretty'
    fp=$fp_dir/${libname^}'.kicad_mod'
    
    # Create library files
    if [ -e $fp_dir ] || [ -e $dcm ] ; then
        #echo 'Footprint' ${libname^} 'already exists!'
        exit 1
    else

    fi
}

function create_library {
    lib=$SYMBOL_DIR/${libname^}'.lib'
    dcm=$SYMBOL_DIR/${libname^}'.dcm'

    # Create library files
    if [ -e $lib ] || [ -e $dcm ] ; then
        echo 'Library' ${libname^} 'already exists!'
        exit 1
    else
        echo -e "EESchema-LIBRARY Version 2.4\n#encoding utf-8\n#\n#End Library" >> $lib
        echo -e "EESchema-DOCLIB  Version 2.0\n#\n#End Doc Library" >> $dcm
    fi
}


read -p 'Symbol library name: ' libname
read -p 'Footprint name: ' libname

create_library
create_footprint