#!/bin/bash

# For my own ap licenses
selections=(OTHER ddsk ddsk_scripts gtl littleben make_target giant context_check act-utils act-techfiles pinpoint toolshed)


selection=

for s in ${selections[@]}; do
  if [[ "$s" == "${1}" ]]; then
    selection=${1}
    shift
    break
  fi
done

if [[ -z "${selection}" ]]; then
  select item in ${selections[@]}; do
    case $item in
      OTHER)
        echo "Type name:"
        read selection
        break ;;
      *)
        selection=$item
        if [[ -z "$selection" ]]; then
          echo "No matching selection, type in full:"
          read selection
        fi
        break ;;
    esac
  done
fi

$HOME/.tmux/tmux_wiz.sh $selection
