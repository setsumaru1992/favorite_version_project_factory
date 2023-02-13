#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

. ${this_script_dir}/log_functions.sh

main () {
  exec_command "yarn add react-hook-form"
  exec_command "yarn add -D eslint prettier eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks @typescript-eslint/eslint-plugin @typescript-eslint/parser"
}

exec_command () {
  command="$1"
  log_this_script_message "$command"
  /bin/bash -c "$command"
  if [ $? != 0 ]; then exit_with_error; fi
}

main
