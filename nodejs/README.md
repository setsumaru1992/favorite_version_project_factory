# 概要
Dockerで新しくnodeアプリケーションを立ち上げるのに、希望のバージョンがローカルにあったり、バージョンを切り替えたりしないとプロジェクトを作れないのが面倒なので、プロジェクトを作るだけの場所を作りました

# 実行方法
以下コマンドを実行するとworkspase内に希望のnodeのバージョンでnextのアプリケーションが出来上がります。
```sh
$ cd /path/to/dir/favorite_version_project_factory
$ docker-compose up

# 別ターミナル
$ docker exec -it node_app_factory bash

# dockerコンテナ
$ ./scripts/create_next_prj.sh (プロジェクト名)
# ウィザードにyの入力など求められたら随時入力
$ cd (プロジェクト名)
$ yarn graphql-code-generator init
# ウィザードにyの入力など求められたら随時入力。最初はデフォルトで全て回答し、後でcodegen.tsを編集する
$ exit

# ローカルターミナル
$ sudo chown -R (ユーザ名):(ユーザ名) (プロジェクト名)
$ mv (プロジェクト名) (好きなところ)
```

アプリケーションが出来上がったら自身のローカルの好きな場所に移動して、実行したり、Dockerのマウントボリュームにしたりして使ってください

# トラブルシューティング
## reactのバージョン競合エラーが起きた
```shell
npm ERR! code ERESOLVE
npm ERR! ERESOLVE could not resolve
npm ERR!
npm ERR! While resolving: @apollo/client@3.1.1
npm ERR! Found: react@18.2.0
npm ERR! node_modules/react
npm ERR!   react@"^18.2.0" from the root project
npm ERR!   peer react@"^18.2.0" from next@13.1.6
npm ERR!   node_modules/next
npm ERR!     next@"latest" from the root project
npm ERR!   1 more (react-dom)
npm ERR!
npm ERR! Could not resolve dependency:
npm ERR! peerOptional react@"^16.8.0" from @apollo/client@3.1.1
npm ERR! node_modules/@apollo/client
npm ERR!   @apollo/client@"3.1.1" from the root project
npm ERR!
npm ERR! Conflicting peer dependency: react@16.14.0
npm ERR! node_modules/react
npm ERR!   peerOptional react@"^16.8.0" from @apollo/client@3.1.1
npm ERR!   node_modules/@apollo/client
npm ERR!     @apollo/client@"3.1.1" from the root project
npm ERR!
npm ERR! Fix the upstream dependency conflict, or retry
npm ERR! this command with --force or --legacy-peer-deps
npm ERR! to accept an incorrect (and potentially broken) dependency resolution.
npm ERR!
npm ERR!
npm ERR! For a full report see:
npm ERR! /root/.npm/_logs/2023-02-13T07_03_15_498Z-eresolve-report.txt

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2023-02-13T07_03_15_498Z-debug-0.log

Aborting installation.
  npm install has failed.
```

よくわかっていないが、`@apollo/client`を入れ直すとエラーは起きなくなる

```shell
$ cd (プロジェクト名)
$ npm i @apollo/client@latest

added 37 packages, and audited 38 packages in 18s

2 packages are looking for funding
  run `npm fund` for details

1 high severity vulnerability

To address all issues, run:
  npm audit fix --force

Run `npm audit` for details.
$ npm audit fix --force
npm WARN using --force Recommended protections disabled.
npm WARN audit Updating lodash to 4.17.21, which is outside your stated dependency range.

changed 1 package, and audited 38 packages in 3s

2 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```