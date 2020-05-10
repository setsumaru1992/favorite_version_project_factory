# 概要
Dockerで新しくnodeアプリケーションを立ち上げるのに、希望のバージョンがローカルにあったり、バージョンを切り替えたりしないとプロジェクトを作れないのが面倒なので、プロジェクトを作るだけの場所を作りました

# 実行方法
以下コマンドを実行するとworkspase内に希望のnodeのバージョンでnextのアプリケーションが出来上がります。
```sh
$ cd /path/to/dir/favorite_version_project_factory/nodejs
$ docker-compose up

# 別ターミナル
$ docker exec -it node_app_factory bash

# dockerコンテナ
$ ./scripts/create_next_prj.sh (プロジェクト名)
$ exit

# ローカルターミナル
$ sudo chown -R (ユーザ名):(ユーザ名) (プロジェクト名)
$ mv (プロジェクト名) (好きなところ)
```

アプリケーションが出来上がったら自身のローカルの好きな場所に移動して、実行したり、Dockerのマウントボリュームにしたりして使ってください