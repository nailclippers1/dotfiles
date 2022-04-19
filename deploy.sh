#!/bin/bash

# =============================================================================
# Download

set -e
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/nailclippers1/dotfiles/tarball/main"
REMOTE_URL="git@github.com:nailclippers1/dotfiles.git"

has() {
  type "$1" > /dev/null 2>&1
}

# How to use
usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [arguments] [command]
Commands:
  deploy
  initialize
Arguments:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

# Options -f:overwrite dotfiles -h:print help
while getopts :f:h opt; do
  case ${opt} in
    f)
      OVERWRITE=true
      ;;
    h)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

if [ -n "${OVERWRITE}" -o ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  rm -rf ${DOT_DIRECTORY}
  mkdir ${DOT_DIRECTORY}

  if type "it" > /dev/null 2>&1; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    m -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$$(tput sgr0)
fi

# =============================================================================
# Deploy

cd ${DOT_DIRECTORY}

for f in .??*
do
# ignore these files
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
# Make links
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}

done

