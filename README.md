# rails7-study

使用バージョン: Rails v7.0.1 / Ruby v3.1.0

## ER図

| 図 | 関連 | 概要 | コミット内容 (日時降順) |
| :--- | :--- | :--- | :--- |
| <img src="https://user-images.githubusercontent.com/5210367/155252998-1eb17a4d-20c2-4ccc-8098-3750776119d9.png" width="400"> | 多対多 / 外部キー制約<img width="200"> | ■ ユーザー新規登録時に、選択したグループとメンバー紐付け。<br />■ Group テーブルに外部キー `user_id` を設定。(目的: グループ選択時に主キーを格納したい。)<br />■ メソッド(オプション): belongs_to / has_many (through)<br />■ 中間テーブル: 不要。<br />■ 中間モデル: Member。<br />■ 備考: `accepts_nested_attributes_for` は不要。 | [ユーザー新規登録画面にグループ選択セレクトボックス設定](https://github.com/okapie/rails7-study/commit/014564de15d3c3023429b0fb7517bf86161deeda#diff-8a9c63a61f6015e5c336f715ea8ac568651a1f72548cea06ba302d99ad02e6d4R21)<br />[`dependent: :destroy` 追加](https://github.com/okapie/rails7-study/commit/014564de15d3c3023429b0fb7517bf86161deeda)<br />[Group テーブルに外部キー追加](https://github.com/okapie/rails7-study/commit/cecf07f0238093b0d07b9855ea54ed77442419dc)<br />[selected_group_id カラム追加](https://github.com/okapie/rails7-study/commit/9bed734cfbc5a344645ff273b0287d8ac05baf91) |
| <img src="https://user-images.githubusercontent.com/5210367/153735726-9cb24520-d6bf-41f5-ae8c-1d4307445cc6.png" width="400"> | 多対多<img width="100"> | ■ ユーザー新規登録時に、自動的にグループ追加とメンバー紐付け。<br />■ メソッド(オプション): belongs_to / has_many (through)<br />■ 中間テーブル: 不要。<br />■ 中間モデル: Member。<br />■ 備考: 中間モデル作成時に外部キーも自動作成。 | [ユーザー新規登録時にグループへ自動追加](https://github.com/okapie/rails7-study/commit/1afe281c36cd20a3eca11a4c233de9c3ad783b76)<br />[多対多の関連付け](https://github.com/okapie/rails7-study/commit/86321f0c60fac1dd5a6ada3a7cec01321207d054)<br />[中間モデル作成](https://github.com/okapie/rails7-study/commit/61b3d9da59fa46e3421906f72bc71c284341b5f3)<br />[Model / Controller 等作成](https://github.com/okapie/rails7-study/commit/4f038f41db3199ee010dbffae8730ccca2ea913c) |

## 項目

### Active Model

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| バリデーション | has_secure_password | - | password アクセサにバリデーションを追加 | [4f2d144](https://github.com/okapie/rails7-study/commit/4f2d144b549f4eb01d4f2868c64d39b25feedc67) |

### Action Controller

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| ストロングパラメータ | permit | - | パラメータの保存許可 | [0b939ae](https://github.com/okapie/rails7-study/commit/0b939aef69301113dff45ab449d5f04c22499fc4) |
| params ハッシュ | params | - | ハッシュにキーをシンボルで渡す | [f99e969](https://github.com/okapie/rails7-study/commit/f99e969fba9560979cb95cf9bb6f0414a8bee993) |
| リダイレクト | redirect_to | - | 別コントローラのアクション呼び出し | [30e0ba9](https://github.com/okapie/rails7-study/commit/30e0ba9fedd4fac8431394a1467470f083433b45) |

### Active Record

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| モデル関連付け | belongs_to / has_many | through | 多対多の繋がりを作成 | [61b3d9d](https://github.com/okapie/rails7-study/commit/61b3d9da59fa46e3421906f72bc71c284341b5f3#diff-fb2a3a4e218b1d05192e06b738333f417713d79e0ef42c90e765d9fd946f08a3R2-R3)<br />[86321f0](https://github.com/okapie/rails7-study/commit/86321f0c60fac1dd5a6ada3a7cec01321207d054) |
| DB 操作 | find_by | - | 条件にマッチする最初のレコードをオブジェクトで返す | [f99e969](https://github.com/okapie/rails7-study/commit/f99e969fba9560979cb95cf9bb6f0414a8bee993) |

### Action View

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| URL ヘルパー | link_to | - | リンクの生成 | [0b0fe90](https://github.com/okapie/rails7-study/commit/0b0fe900f50749792d6125ab3e4a7ce80b6840a7) |

### キャッシュ

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| セッション | session | - | セッション保存 | [6075249](https://github.com/okapie/rails7-study/commit/6075249e9fe33758127ff1ac660aec70d3d6d0cc) |
| セッション | reset_session | - | 全セッション情報削除 | [6075249](https://github.com/okapie/rails7-study/commit/6075249e9fe33758127ff1ac660aec70d3d6d0cc) |

### Ruby

| 概念 / 機能 | メソッド | 演算子 | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| 自己代入演算子 | - | ```a \|\|= xxx``` | a が 偽 か 未定義 なら a に xxx を代入 | [7760be6](https://github.com/okapie/rails7-study/commit/7760be625afdf74f23e9f23d427b3d6cefd56619) |
| 記号 ```?``` | ー | ```def xx？``` | 真偽値を返すメソッド定義 | [7760be6](https://github.com/okapie/rails7-study/commit/7760be625afdf74f23e9f23d427b3d6cefd56619) |
