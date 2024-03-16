#!/usr/bin/env bash

set -eEou pipefail

trap 'printf "\n\e[31mError: Exit Status %s (%s)\e[m\n" $? "$(basename "$0")"' ERR

cd "$(dirname "$0")"

echo
echo "Start ($(basename "$0"))"

echo
echo "Setup"
echo "= = ="
echo

source set-env-vars.sh

echo "Not yet implemented"
echo "See: https://fedoraproject.org/wiki/Kernel_Vanilla_Repositories#How_to_remove_the_kernel_vanilla_repositories_and_uninstall_kernels_installed_from_them"

echo
echo "Done ($(basename "$0"))"
