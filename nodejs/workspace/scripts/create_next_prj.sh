#! /bin/bash

script_exec_path=$(pwd)
this_script_dir=$(cd $(dirname $0) && pwd) # 絶対パスにするためにpwd(dirnameだと相対パス)

. ${this_script_dir}/log_functions.sh

main () {
  app_name=$1

  validate $app_name

  create_next_app $app_name
  cd ${app_name}

  install_libraries
}

validate () {
  app_name=$1
  if [ "$app_name" = "" ];then
    raise_error "引数にアプリ名を入力して再実行してください"
  fi
}

create_next_app () {
  app_name=$1
  npx create-next-app ${app_name} --example with-apollo
  if [ $? != 0 ]; then exit_with_error; fi
}

install_libraries () {
  log_this_script_message "必要なライブラリをインストールします"
  $this_script_dir/yarn_add_graphql_mod.sh
  $this_script_dir/yarn_add_useful_mod.sh
}

main "$1"
