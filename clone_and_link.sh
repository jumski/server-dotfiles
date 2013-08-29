#!/bin/bash

pushd "$HOME"

  if [ -d ".dot-files" ]; then
    pushd ".dot-files"
      git fetch origin
      git reset --hard origin/master
    popd
  else
    git clone "git://github.com/jumski/server-dotfiles.git" ".dot-files"
  fi

  ls -1d .dot-files/files/* .dot-files/files/.* | while read f; do
    [ "$f" == '.dot-files/files/.' ] ||
    [ "$f" == '.dot-files/files/..' ] ||
    [ "$f" == '.dot-files/files/.git' ] ||
    ln -vsf "$f" .
  done

popd
