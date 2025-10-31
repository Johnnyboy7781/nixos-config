# System rebuild
rebuild() {
  cd ~/nixos-config
  git add .
  read "?Commit message: " msg
  git commit -m $msg
  sudo nixos-rebuild switch --impure
  git push
}
