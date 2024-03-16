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

echo
echo "Create RPM topdir (build directory)"
echo "- - -"

mkdir -vp $build_dir/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

if [ -d $build_dir/SOURCES/.git ]; then
  printf "\e[1;33mRepository already cloned\e[39;22m\n"
else
  git clone --depth 1 $REPOSITORY_URL $build_dir
fi

ln -svf ../SOURCES/kernel.spec $build_dir/SPECS/kernel.spec

echo
echo "Download Kernel Source"
echo "- - -"
kernel_version=$(sed -n -e 's/%define tarfile_release \(.*\)$/\1/p' builds/rog/SPECS/kernel.spec)
echo "Kernel Version: $kernel_version"
kernel_source_archive=$(sed -n -e "s/Source0: \(linux-\)%{tarfile_release}\(.tar.xz\)/\1$kernel_version\2/p" builds/rog/SPECS/kernel.spec)
(set -x; curl --output builds/rog/SOURCES/$kernel_source_archive --time-cond builds/rog/SOURCES/$kernel_source_archive https://cdn.kernel.org/pub/linux/kernel/v6.x/$kernel_source_archive)

echo
echo "Install Build Dependencies"
echo "- - -"

dnf builddep $build_dir/SPECS/kernel.spec

echo
echo "Done ($(basename "$0"))"
