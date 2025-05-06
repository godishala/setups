HSDIR="$HOME/setup/homedir"
SETBIN="$HOME/setup/bin"
HBACKUP="$HOME/.backups"
rsync -ravz "$HBACKUP"/homedir/ "$HSDIR"
rsync -ravz "$HBACKUP"/bin/ "$SETBIN"
cd "$HOME/setup"
git add .
echo "$PWD"
git commit -m "updates as of '$TIMESTAMP'"
git push origin main





