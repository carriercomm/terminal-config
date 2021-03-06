#!/usr/bin/env bash

# Determine what is currently installed.

TC_DIR=`pwd`

if [ -f ${TC_DIR}/bash/colors/colors.bash ]; then
    source ${TC_DIR}/bash/colors/colors.bash
fi

if [ -d $HOME/.bash/ ]; then
  echo
  echo -e "${echo_bold_purple} What's Installed?${echo_reset_color}"
  echo
  # Determines what scripts are available for useage.
  for directory in "aliases" "plugins" "completions"
  do
    echo -e "${echo_bold_cyan} $( echo ${directory} | tr [a-z] [A-Z]) ${echo_reset_color}"
    echo

    for file in `ls $HOME/.bash/${directory}/*`
    do
      case ${directory} in
        "themes")
            filename=$(echo ${file##*/})
            case $filename in
                *theme*)
                echo "   $(echo ${filename%.*})"
                ;;
            esac
        ;;
        *)
          filename=$(echo ${file##*/})
          echo "   $(echo ${filename%.*})"
        ;;
      esac
    done
    echo
  done
else
  echo -e "Nothing is installed or TC_COMPILE was used."
fi
