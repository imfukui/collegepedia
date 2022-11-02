# Collegepedia

海外の大学(主にアメリカ)に留学している学生が所属する学校やそこでの授業の雰囲気、評価を投稿するwebアプリケーションです。
どの授業を選択するか迷っている留学中の学生はもちろん、『長期留学に興味があるけど現地での生の声を聞きたい。』、『大学の雰囲気について詳しく知りたい！』という長期留学を考えている日本の学生の方々にも情報収集の場として役立てていただけます。
<img width="1097" alt="スクリーンショット 2022-10-31 15 22 39" src="https://user-images.githubusercontent.com/98569234/199151083-2f3997ae-c25d-40fb-a827-88d3bbcea7ef.png">

##### URL
 [http::/3.115.167.14](http::/3.115.167.14)

## 使用技術

* Ruby 3.0.4

* Ruby on Rails 6.1.6

* PostgreSQL 13.7

* Puma

* Nginx

* AWS
  - VPC
  - EC2
  - RDS
  - S3

* Docker/docker-compose

* RSpec

## 利用方法
1. ホーム画面上部の”Login”をクリックしアカウント登録、またはログインします。
<img width="814" alt="スクリーンショット 2022-10-31 15 32 14" src="https://user-images.githubusercontent.com/98569234/198945788-cea191ef-512e-40c6-8082-7d53f0c98ec4.png">

2. ログイン後ホーム画面の検索窓で学校名または州名を入力。
<img width="582" alt="スクリーンショット 2022-10-31 16 16 55" src="https://user-images.githubusercontent.com/98569234/198952792-9e2ab716-fc10-4fbe-96c8-b36f4a24535e.png">

3. ”Search”ボタンをクリックし、検索結果の中から大学を選択。
<img width="705" alt="スクリーンショット 2022-10-31 16 21 21" src="https://user-images.githubusercontent.com/98569234/198953472-5506fb5f-2dc1-4daa-b038-d1a0fe2334a6.png">

4. 学校詳細ページに移ったら、Reviews以下で投稿された評価を見ることができ、投稿したユーザーのユーザーネームをクリックするとユーザー詳細ページを確認できます。また、”評価を追加”で評価を新規作成、左の"Class List"をクリックするとその大学の授業一覧を確認できます。
<img width="923" alt="スクリーンショット 2022-10-31 16 25 30" src="https://user-images.githubusercontent.com/98569234/198954472-6f847117-bba7-448b-863c-2c89146eb028.png">

5. "Class List"をクリックすると以下のようにクラス一覧が見れます。探している授業が一覧にない場合は、"クラスを追加"で新規登録が可能です。クラス名の一つをクリックすると授業の詳細ページへ移ります。
<img width="918" alt="スクリーンショット 2022-10-31 16 34 35" src="https://user-images.githubusercontent.com/98569234/198956596-cc299cdb-9e87-4b21-8b49-2344689c6e7f.png">

6. 授業の詳細ページでその授業のレビューを確認できます。また、"授業の評価を追加"でレビューの新規作成が可能です。
<img width="912" alt="スクリーンショット 2022-10-31 16 43 07" src="https://user-images.githubusercontent.com/98569234/198957017-836fa2dd-d28e-494c-ac1c-9dd06500e06f.png">

7. ユーザー詳細ページではそのユーザーの投稿一覧を確認できます。自身のユーザー詳細ページでは、投稿の編集や削除もできます。
<img width="950" alt="スクリーンショット 2022-10-31 17 02 00" src="https://user-images.githubusercontent.com/98569234/198960085-d5161ea3-ea6c-4f19-b9c2-6db65fabd3b0.png">

## 管理権限を持つユーザーの利用方法
このアプリケーションは日本から留学生を受け入れるコミュニティーカレッジやファウンデーションプログラムの運営団体に導入していただくことを想定して作成したので、管理権限を持つユーザーのみが使用できる管理者用画面を作成しております。
### 管理権限を持つユーザーのサンプルアカウント
メールアドレス:adminuser@example.com/パスワード:@dminp@ss

管理者用アカウントでログインするとフッター部分に"管理者ログイン"ボタンが出ますのでそれを選択すると管理者用画面にアクセスできます。
<img width="987" alt="スクリーンショット 2022-10-31 17 20 11" src="https://user-images.githubusercontent.com/98569234/198963208-70824391-78a3-4f0f-a19e-e4a7c7419b39.png">

### 管理者用画面
学校の新規登録は管理権限を持つユーザーのみの機能ですので、管理画面から新しく学校を追加できます。
<img width="993" alt="スクリーンショット 2022-10-31 17 17 10" src="https://user-images.githubusercontent.com/98569234/198962653-f03b63fa-ed78-4cd4-8577-755b238aed1a.png">

## AWS構成図
![AWS](https://user-images.githubusercontent.com/98569234/199191749-58ca65b6-973f-43fa-b6cb-d5340eea4a92.png)

## データベースER図
![Model](https://user-images.githubusercontent.com/98569234/199454414-3b592b76-80c5-4faf-be28-1a93905ad987.png)

## 機能一覧
