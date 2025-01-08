#!/usr/bin/bash
# THIS COPIES FOLDERS INSIDE TO_MOVE ARRAY TO .CONFIG FOLDER
to_move=("sway", "qutebrowser", "alacritty", "zsh", "mimeapps.list", "wallpapers")

source_folder=".config"
destination_folder="$HOME/.config/"

# TODO: make the for loop accept home files (.zshrc)
for folder in $(ls -d "$source_folder"/*); do
	folder_name=$(basename "$folder")
	if [[ "${to_move[@]}" =~ "${folder_name}" ]]; then
		echo "Copy $folder to $destination_folder"
		cp -r "$folder" "$destination_folder"
	fi
done

echo "Copy .zshrc to ~/"
cp .zshrc ~/
echo "Copy .zshrc to ~/"
cp .ideavimrc ~/
