if [ -z "${BUILD_NAME:-}" ]; then
  default="rog"
  printf "\e[2;3m(BUILD_NAME isn't set, default is $default\e[23;22m\n"
  BUILD_NAME=$default
  unset default
fi
export BUILD_NAME
echo "BUILD_NAME: $BUILD_NAME"

build_dir="builds/$BUILD_NAME"
export build_dir

if [ -z "${REPOSITORY_URL:-}" ]; then
  default="https://gitlab.com/asus-linux/fedora-kernel.git"
  printf "\e[2;3m(REPOSITORY_URL isn't set, default is $default\e[23;22m\n"
  REPOSITORY_URL=$default
  unset default
fi
export REPOSITORY_URL
echo "REPOSITORY_URL: $REPOSITORY_URL"

echo "Build Directory: $build_dir"
