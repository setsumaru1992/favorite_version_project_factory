#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(dirname $0)

. ${this_script_dir}/log_functions.sh

main () {
  # 以下に既に入っているため除外
  # https://github.com/zeit/next.js/blob/canary/examples/with-apollo/package.json
  # exec_command "yarn add graphql"

  exec_command "yarn add -D @graphql-codegen/cli"
}

exec_command () {
  command="$1"
  log_this_script_message "$command"
  /bin/bash -c "$command"
  if [ $? != 0 ]; then exit_with_error; fi
}

main
