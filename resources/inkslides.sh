#!/usr/bin/env bash

set -eu

infile=${1:-unset}

if [[ "$infile" == "unset" ]]; then
    echo "file must be input as argument"
    exit 1
fi

if [[ ! -f "$infile" ]]; then
    echo "file ${infile} does not exist"
    exit 1
fi

name="$(basename "$infile" .svg)"
basedir="$(dirname "$infile")"
outdir="${basedir}/_${name}"

mkdir -p "${outdir}"
cp "$infile" "${outdir}/"
python "${basedir}/inkscape-slide.py" "${outdir}/${name}.svg" --format "${outdir}/{1:d}.pdf"
