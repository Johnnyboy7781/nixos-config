# System rebuild
rebuild() {
  cd ~/nixos-config

  # Check if there are any changes to the config
  changes=$(git status -s)
  if [[ -z $changes ]]; then
    echo "No changes to apply, aborting rebuild"
    return 1
  fi

  git add .
  read "?Commit message: " msg
  git commit -m $msg

  sudo nixos-rebuild switch --impure

  if [[ $status != 0 ]]; then
    echo "Rebuild failed, skipping push"
    return 1
  fi

  echo "Rebuild successful, pushing changes"
  git push
}
