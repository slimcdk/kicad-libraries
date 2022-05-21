#!/bin/bash


if ! command -v pip &> /dev/null || ! command -v pip3 &> /dev/null
then
    echo "pip could not be found"
    exit
fi
pip install easyeda2kicad


PARTS_LIST=generated-lcsc/lcsc-component-list-$(date --iso-8601).csv
curl -o $PARTS_LIST https://jlcpcb.com/componentSearch/uploadComponentInfo
TOTAL=$(wc -l < $PARTS_LIST)


function cleanup() {
    echo "Cleaning up"
    find generated-lcsc/.3d-packages -mindepth 2 -type f -exec mv {} generated-lcsc/3d-packages \;
    rm -rf generated-lcsc/.3d-packages
    rm -rf generated-lcsc/footprints/*.3dshapes
    rm -rf generated-lcsc/footprints/*.kicad_sym
    rm -rf generated-lcsc/symbols/*.3dshapes
    rm -rf generated-lcsc/symbols/*.pretty
    rm -f $PARTS_LIST
}

mkdir -p generated-lcsc/{symbols,footprints,3d-packages,.3d-packages}

echo "Generating $TOTAL packages"
trap cleanup EXIT
while IFS="," read -r partid partcat rec_column3
do
    LIB=$(echo $partcat | sed -r 's/[/ -]+/_/g' | sed -r 's/__\+/_/g')
    easyeda2kicad --symbol --lcsc_id=$partid --output generated-lcsc/symbols/$LIB --overwrite
    easyeda2kicad --footprint --lcsc_id=$partid --output generated-lcsc/footprints/$LIB --overwrite
    easyeda2kicad --3d --lcsc_id=$partid --output generated-lcsc/.3d-packages/$LIB --overwrite
done < <(tail -n +2 $PARTS_LIST)