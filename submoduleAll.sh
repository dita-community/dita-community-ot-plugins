#!/bin/bash

# This script sets up every DITA Community plugin as a submodule under the
# specified directory (e..g, DITA-OT/plugins
# usage: ./submoduleAll.sh <path/to/dir>

# find right location
realpath() {

  case $1 in
    /*) echo "$1" ;;
    *) echo "$PWD/${1#./}" ;;
  esac
}

CURRENT_DIR="$(dirname "$(realpath "$0")")"

# check paramaters
if  [ $# -ne 1 ]
then
  echo ""
  echo " ! Please provide the location where you want the plugin submodules to be initialized."
  echo ""
  exit 1
fi

CLONEPATH=$1

# clone
git submodule add -f https://github.com/dita-community/org.dita-community.adjust-copy-to.git ${CLONEPATH}/org.dita-community.adjust-copy-to
git submodule add -f https://github.com/dita-community/org.dita-community.common.xslt.git ${CLONEPATH}/org.dita-community.common.xslt
git submodule add -f https://github.com/dita-community/org.dita-community.doctypes.git ${CLONEPATH}/org.dita-community.doctypes
git submodule add -f https://github.com/dita-community/org.dita-community.media-d.doctypes.git ${CLONEPATH}/org.dita-community.media-d.doctypes
git submodule add -f https://github.com/dita-community/org.dita-community.media-d.html.git ${CLONEPATH}/org.dita-community.media-d.html
git submodule add -f https://github.com/dita-community/org.dita-community.preprocess-extensions.git ${CLONEPATH}/org.dita-community.preprocess-extensions
git submodule add -f https://github.com/dita-community/org.dita-community.ruby-d.doctypes.git ${CLONEPATH}/org.dita-community.ruby-d.doctypes
git submodule add -f https://github.com/dita-community/org.dita-community.ruby-d.fo.git ${CLONEPATH}/org.dita-community.ruby-d.fo
git submodule add -f https://github.com/dita-community/org.dita-community.ruby-d.html.git ${CLONEPATH}/org.dita-community.ruby-d.html
git submodule add -f https://github.com/dita-community/org.dita-community.variables-d.git ${CLONEPATH}/org.dita-community.variables-d
