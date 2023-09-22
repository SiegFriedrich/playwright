# E2E TEST Playwright 実行手順

### 1 Dockerイメージを作る （今回のイメージ名はtestにした、バージョンはv1）
Playwrightディレクトリ直下に下のコメントを叩いてください

```
docker build ./ -t test:v1
 ```

### 2 container を実行する (container内のhostsにホスト機のアドレスをhost.docker.internalにマッピングする)

```
docker run -d --add-host host.docker.internal:host-gateway test:v1
```
実行してから、container ID が出ているはず

例：
```
siegfriedrich@SiegdeMBP ~ % docker run -d --add-host host.docker.internal:host-gateway test-playwright:v3
fa5e0029eb88987ded77aff2b29bf200472048b2a5069da908519ea92b316e41
siegfriedrich@SiegdeMBP ~ %
```


### 3　containerに入る　

> Docker GUIアプリをインストールされている方へ　

鯨のICONのDockerアプリを開いて、作ったtest:v1のcontainerをクリックしたら、実行詳細を見られるはず

>　（↑のステップができたら、この行の作業は不要）Docker GUIアプリインストールされていない方へ

**docker exec -it [container id] /bin/bash**

例：
```
docker exec -it 21c00a7ac197cc31bb5b25fda89c75a13f97360268dfd5ff8ae7914f15a84605 /bin/bash
```

playwrightを実行

```
root@fa5e0029eb88:/app# npx playwright test    

Running 44 tests using 2 workers
  44 passed (1.8m)

To open last HTML report run:

  npx playwright show-report

root@fa5e0029eb88:/app#

```
