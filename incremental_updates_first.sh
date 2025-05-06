#!/bin/bash
HOMEDIR="$HOME/.backups/homedir"
SETBIN="$HOME/.backups/bin"


mkdir -p $HOMEDIR
mkdir -p $SETBIN


for files in ".zshrc*" ".tmux*" ".bash*" ".oh*" ".sh*" "res*"; do
	rsync -ravz "$HOME"/$files "$HOMEDIR"
done

rsync -ravz "$HOME"/bin/ $SETBIN

