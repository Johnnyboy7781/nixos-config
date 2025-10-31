# System rebuild
rebuild() {
  cd ~/nixos-config

  # Check if there are any changes to the config
  changes=$(git status -s)

  if [[ -z $changes ]]; then
    read "proceed-without-changes?No changes to apply, continue? (y/N)"

    if [[ -z $proceed-without-changes ]]; then
      proceed-without-changes="n"
    fi

    if [[ ${(L)proceed-without-changes} == "n" ]]; then
      return 1
    fi
  fi

  if [[ -z $proceed-without-changes ]]; then
    git add .
    read "?Commit message: " commit-msg
    git commit -m $commit-msg
  fi

  sudo nixos-rebuild switch --impure

  if [[ $status != 0 ]]; then
    echo "Rebuild failed, skipping push"
    return 1
  fi

  if [[ -z $proceed-without-changes ]]; then
    git push
  fi
}
