# 概要
Dockerで新しくnodeアプリケーションを立ち上げるのに、希望のバージョンがローカルにあったり、バージョンを切り替えたりしないとプロジェクトを作れないのが面倒なので、プロジェクトを作るだけの場所を作りました

# 実行方法
以下コマンドを実行するとworkspase内に希望のrubyのバージョンでrailsのアプリケーションが出来上がります。
```sh
$ cd /path/to/dir/favorite_version_project_factory
$ docker-compose up

# 別ターミナル
$ docker exec -it ruby_app_factory bash

# dockerコンテナ
$ rails new (プロジェクト名)

$ exit

# ローカルターミナル
$ sudo chown -R (ユーザ名):(ユーザ名) (プロジェクト名)
$ mv (プロジェクト名) (好きなところ)
```

アプリケーションが出来上がったら自身のローカルの好きな場所に移動して、実行したり、Dockerのマウントボリュームにしたりして使ってください

# トラブルシューティング
## webpack:install失敗
```sh
# 以下エラーが起きる(bin/rails webpacker:installの失敗)
         run  bundle exec spring binstub --all
* bin/rake: Spring inserted
* bin/rails: Spring inserted
       rails  webpacker:install
Traceback (most recent call last):
        3: from bin/rails:8:in '<main>'
        2: from bin/rails:8:in 'require_relative'
        1: from /root/workspace/(プロジェクト名)/config/boot.rb:4:in '<top (required)>'
$ cd (プロジェクト名)
$ bin/rails webpacker:install
```