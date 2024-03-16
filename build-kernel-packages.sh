#!/usr/bin/env bash

set -eEou pipefail

trap 'printf "\n\e[31mError: Exit Status %s (%s)\e[m\n" $? "$(basename "$0")"' ERR

cd "$(dirname "$0")"

echo
echo "Start ($(basename "$0"))"

echo
echo "Build Kernel Packages"
echo "= = ="
echo

source set-env-vars.sh

rpmbuild -ba --define "_topdir $(realpath $build_dir)" $build_dir/SPECS/kernel.spec

echo
echo "Done ($(basename "$0"))"
