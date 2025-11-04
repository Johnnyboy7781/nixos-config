# System rebuild
rebuild() {
  originalDir=$(pwd)

  cd ~/nixos-config

  proceedWithoutChanges=""

  # Check if there are any changes to the config
  changes=$(git status -s)

  if [[ -z $changes ]]; then
    read -q "proceedWithoutChanges?No changes to apply, continue? (y/N)"

    if [[ -z $proceedWithoutChanges ]]; then
      proceedWithoutChanges="n"
    fi

    if [[ ${(L)proceedWithoutChanges} == "n" ]]; then
      echo "Aborting rebuild"
      return 1
    fi
  fi

  if [[ -z $proceedWithoutChanges ]]; then
    git add .
    read "?Commit message: " commitMsg
    git commit -m ${(L)commitMsg}
  fi

  # Impure due to absolute path for cacert
  sudo nixos-rebuild switch --impure

  if [[ $status != 0 ]]; then
    echo "Rebuild failed, skipping push"
    return 1
  fi

  if [[ -z $proceedWithoutChanges ]]; then
    git push
  fi

  cd $originalDir
}
