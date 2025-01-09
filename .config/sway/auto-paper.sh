#!/usr/bin/bash
# requires: curl, libxml2-utils(xmllint)

mapfile -t urls < <(curl -s https://bingwallpaper.anerg.com/ | xmllint --html --xpath "//img/parent::a/@href" - 2>/dev/null | sed 's/href=//g' | sed 's/"//g')

length="${#urls[@]}"

random_i=$((RANDOM % length))
random_url="${urls[$random_i]/\/}"
full_url=$(echo "https://bingwallpaper.anerg.com/$random_url" | sed 's/ //')

image_url=$(curl -s $full_url | xmllint --html --xpath "//a[contains(@href, '3840')]/@href" - 2>/dev/null | sed 's/href=//g' | sed 's/"//g')

curl -s $image_url > /tmp/wallpaper.jpg
sway output "*" bg /tmp/wallpaper.jpg fill >/dev/null
