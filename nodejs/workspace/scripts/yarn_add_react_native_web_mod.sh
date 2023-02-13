#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

. ${this_script_dir}/log_functions.sh

main () {
  exec_command "yarn add react-native-web"
  exec_command "yarn add -D babel-plugin-react-native-web"
  exec_command "yarn add -D @types/react-native @types/react-test-renderer"
}

exec_command () {
  command="$1"
  log_this_script_message "$command"
  /bin/bash -c "$command"
  if [ $? != 0 ]; then exit_with_error; fi
}

main
