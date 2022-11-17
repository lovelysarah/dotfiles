#!/bin/env bash

# Contributor: Sarah Robichaud
#
WIN=$(xdotool getactivewindow getwindowname)

CHROME="- Google Chrome"
FIREFOX="— Mozilla Firefox"

DDG="at DuckDuckGo"
GOOGLE_SEARCH="- Google Search"
YOUTUBE="- YouTube"

custom_text(){
  case $4 in 
    'prefix')
      PREFIX="<span color='$3'>$2</span>"
     ;;

    'suffix')
      SUFFIX="<span color='$3'>$2</span>"
     ;;
  esac
  WIN=$(echo $WIN | awk -F "$1" '{print $1}')
}

detect_browser(){
  if [[ $WIN == *"$1"* ]];
  then
    custom_text "$1" "$2" "$3" "suffix"
  fi
}

detect_site(){
  if [[ $WIN == *"$1"* ]];
  then
    if ["$1" == "$YOUTUBE"];
    then
      IS_YOUTUBE=true
    fi
    custom_text "$1" "$2" "$3" "prefix"
  fi
}

detect_browser "$CHROME" "in Chrome" "#FFFC58"
detect_browser "$FIREFOX" "in Firefox" "#FFFC58"

detect_site "$DDG" "DDG Results for" "grey"
detect_site "$GOOGLE_SEARCH" "Google Results for" "grey"
detect_site "$YOUTUBE" "Watching" "#FF0055"


if [ ${#WIN} -gt 40 & $ON_YOUTUBE == true]; then
	WIN=$(echo $WIN | cut -c 1-40)
  WIN="${WIN}..."
fi

FULL_TEXT="$PREFIX $WIN $SUFFIX"
SHORT_TEXT=$WIN

echo $FULL_TEXT
echo $SHORT_TEXT
echo "#FFFFFF"
exit 0
