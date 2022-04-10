# rails7-study

## 概要

本プロジェクトは、モデルの関連付けや値オブジェクトを表現するためのサンプルである。

## 仕様

- 初回アクセス時にユーザー登録が必要。
- `/` へアクセスした際、ログイン済みの場合は、会員 (Member) ページ `/member` へ自動遷移される。
- 登録時に、任意でグループ (Group) を選択することが出来る。
- 会員は、おもちゃ (Toy) 一覧 `/toys` から、ブックマークと解除が可能。
- お気に入り (Favorite) 一覧を会員ページで確認することが出来る。
- おもちゃは、メーカーと店舗に紐付いており、おもちゃ一覧で確認することが出来る。

## 使用技術

バージョン: Rails v7.0.1 / Ruby v3.1.0

## ER 図

#### Rails-ERD で出力した ER 図

<img src="https://user-images.githubusercontent.com/5210367/162615899-7ea4f1c9-efe4-409c-bee9-b49e8dda4ad3.png">

#### 関連付け毎の ER 図

| 図 | 関連 | 概要 | コミット内容 (日時降順) |
| :--- | :--- | :--- | :--- |
| <img src="https://user-images.githubusercontent.com/5210367/161360847-7c65be2d-79d4-48cd-ae5f-3e43a9f1d90a.png" width="400"> | 一対多<img width="100"> | ■ カレントメンバーと Favorite 一覧を紐付け。 | [メンバーページに Favorite 一覧表示](https://github.com/okapie/rails7-study/commit/c4b4b56c203c3ad5ecad36b008f5cae890c3dd42)<br />[Toy のブックマーク時に Favorite テーブルに自動追加](https://github.com/okapie/rails7-study/commit/cd9fc9410161ce9df486430656039b151a2417ec)<br />[Favorite に外部キー制約設定](https://github.com/okapie/rails7-study/commit/0b7196bfa554320577a2fd81732829db62aead9b)<br />[Favorite テーブル作成時に reference 型のカラムを定義](https://github.com/okapie/rails7-study/commit/58e2d8fc07ec897e301824582229b442b87d5f80)<br />[一対多の関連付け](https://github.com/okapie/rails7-study/commit/861f52462738664bd9b9a97db14c324c9cc84a0e) |
| <img src="https://user-images.githubusercontent.com/5210367/158376842-8d0b9ce9-edc9-4958-91c0-cdc94703247f.png" width="400"> | ポリモーフィック関連付け<img width="200"> | ■ Store と Maker に共通する性質を表す `buyable` を設定。(目的: Toy の製造時に Store と Maker を紐付けしたい。)<br />■ メソッド(オプション): belongs_to (polymorphic) / has_many (as)<br />■ 中間テーブル: 不要。<br />■ 中間モデル: Toy。 | [Toy 新規登録画面に Maker 選択セレクトボックス設定](https://github.com/okapie/rails7-study/commit/8f46be41633cf5ef495b87b61a9d3924184ab46d)<br />[Toy 新規登録画面に Store 選択セレクトボックス設定](https://github.com/okapie/rails7-study/commit/b53472740044e2a001f34bc0ede9c88428a02e38)<br />[as オプション (has_many) 設定](https://github.com/okapie/rails7-study/commit/8cfb97c31c2d267fe7f0b73a577f1ca283c26400)<br />[Maker (Model / Controller 等) 作成](https://github.com/okapie/rails7-study/commit/aa04ae4c4506ab3ebb6d7622736a1b2d24e24114)<br />[Store (Model / Controller 等) 作成](https://github.com/okapie/rails7-study/commit/4012787f83b21267e1f7d9b5922c97b6dde04ad1)<br />[中間モデル作成](https://github.com/okapie/rails7-study/commit/5e64f70c16f96a77fe76388aaf1de37a4ffe8bee) |
| <img src="https://user-images.githubusercontent.com/5210367/158376856-2aa9320b-e236-4083-8394-e8bf8f54e3d9.png" width="400"> | 多対多 / 外部キー制約<img width="200"> | ■ ユーザー新規登録時に、選択したグループと紐付け。(未選択も許容)<br />■ Group テーブルに外部キー `user_id` を設定。(目的: グループ選択時に主キーを格納したい。)<br />■ メソッド(オプション): belongs_to / has_many (through)<br />■ 中間テーブル: 不要。<br />■ 中間モデル: Member。<br />■ 備考: `accepts_nested_attributes_for` は不要。 | [ユーザー新規登録画面にグループ選択セレクトボックス設定](https://github.com/okapie/rails7-study/commit/014564de15d3c3023429b0fb7517bf86161deeda#diff-8a9c63a61f6015e5c336f715ea8ac568651a1f72548cea06ba302d99ad02e6d4R21)<br />[`dependent: :destroy` 追加](https://github.com/okapie/rails7-study/commit/014564de15d3c3023429b0fb7517bf86161deeda)<br />[Group テーブルに外部キー追加](https://github.com/okapie/rails7-study/commit/cecf07f0238093b0d07b9855ea54ed77442419dc)<br />[selected_group_id カラム追加](https://github.com/okapie/rails7-study/commit/9bed734cfbc5a344645ff273b0287d8ac05baf91) |
| <img src="https://user-images.githubusercontent.com/5210367/158376862-b26a062f-09b3-4e4b-bf43-4047a1e2b082.png" width="400"> | 多対多<img width="100"> | ■ ユーザー新規登録時に、自動的にグループ追加。<br />■ メソッド(オプション): belongs_to / has_many (through)<br />■ 中間テーブル: 不要。<br />■ 中間モデル: Member。<br />■ 備考: 中間モデル作成時に外部キーも自動作成。 | [ユーザー新規登録時にグループへ自動追加](https://github.com/okapie/rails7-study/commit/1afe281c36cd20a3eca11a4c233de9c3ad783b76)<br />[多対多の関連付け](https://github.com/okapie/rails7-study/commit/86321f0c60fac1dd5a6ada3a7cec01321207d054)<br />[中間モデル作成](https://github.com/okapie/rails7-study/commit/61b3d9da59fa46e3421906f72bc71c284341b5f3)<br />[Model / Controller 等作成](https://github.com/okapie/rails7-study/commit/4f038f41db3199ee010dbffae8730ccca2ea913c) |

## 項目

### Active Model

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| スコープのマージ | scope | - | 未設定以外に絞り込み、昇順ソート | [0df21ce](https://github.com/okapie/rails7-study/commit/0df21ce38dd9bfd9076db8f36e9f37b56c9201c2) |
| スコープ | scope | - | where.not に scope の引数を渡し `未設定` 以外を返す | [](https://github.com/okapie/rails7-study/commit/5bd9ed70fc504fe7a92de19c49979226a0a6cab8) |
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
| 値オブジェクト | composed_of | mapping / class_name | 2 属性から値オブジェクトを取得出来るように設定 | [0afd231](https://github.com/okapie/rails7-study/commit/0afd231c58b6e9ee0d38e984afc7af1e0b76edfd) |
| UNIQUE 制約 | - | - | 既存テーブルに index (unique) を追加 | [d08bed1](https://github.com/okapie/rails7-study/commit/d08bed14983dba2df76e511682b509d0c12be635) |
| モデル関連付け | belongs_to / has_many | - | 1対多の繋がりを作成 | [861f524](https://github.com/okapie/rails7-study/commit/861f52462738664bd9b9a97db14c324c9cc84a0e) |
| 外部キー制約 | - | - | マイグレーション時にリファレンス追加 (foreign_key オプション設定) | [0b7196b](https://github.com/okapie/rails7-study/commit/0b7196bfa554320577a2fd81732829db62aead9b) |
| ポリモーフィック関連付け | belongs_to / has_many | polymorphic (belongs_to) / as (has_many) | 他テーブルのレコードの紐付け | [8cfb97c](https://github.com/okapie/rails7-study/commit/8cfb97c31c2d267fe7f0b73a577f1ca283c26400)<br />[5e64f70](https://github.com/okapie/rails7-study/commit/5e64f70c16f96a77fe76388aaf1de37a4ffe8bee) |
| モデル関連付け | belongs_to / has_many | through | 多対多の繋がりを作成 | [61b3d9d](https://github.com/okapie/rails7-study/commit/61b3d9da59fa46e3421906f72bc71c284341b5f3#diff-fb2a3a4e218b1d05192e06b738333f417713d79e0ef42c90e765d9fd946f08a3R2-R3)<br />[86321f0](https://github.com/okapie/rails7-study/commit/86321f0c60fac1dd5a6ada3a7cec01321207d054) |
| DB 操作 | find_by | - | 条件にマッチする最初のレコードをオブジェクトで返す | [f99e969](https://github.com/okapie/rails7-study/commit/f99e969fba9560979cb95cf9bb6f0414a8bee993) |

### Action View

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| フォーム | collection_select | prompt | モデルの情報を元に選択ボックスを生成 | [8f46be4](https://github.com/okapie/rails7-study/commit/8f46be41633cf5ef495b87b61a9d3924184ab46d) |
| URL ヘルパー | link_to | - | リンクの生成 | [0b0fe90](https://github.com/okapie/rails7-study/commit/0b0fe900f50749792d6125ab3e4a7ce80b6840a7) |

### ルーティング

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| ノンリソースフルルーティング | root | - | Rails がルート '/' とすべき場所を指定 | [b8be8cb](https://github.com/okapie/rails7-study/commit/b8be8cbb069298497cd1eb68c98e8abf8dfcec92) |
| リソースフルルーティング | member | - | Rails で定義される 7 つのアクション以外のルーティングを設定 | [524842b](https://github.com/okapie/rails7-study/commit/524842be4744d553e03f3906b989de3d181f42f1#diff-959bc9abc46a55332bb64d5155a79323afa75a50ec1a2137ddd22d926f62c6c5R7-R10) |

### キャッシュ

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| セッション | session | - | セッション保存 | [6075249](https://github.com/okapie/rails7-study/commit/6075249e9fe33758127ff1ac660aec70d3d6d0cc) |
| セッション | reset_session | - | 全セッション情報削除 | [6075249](https://github.com/okapie/rails7-study/commit/6075249e9fe33758127ff1ac660aec70d3d6d0cc) |

### 国際化 (i18n)

| 概念 / 機能 | メソッド | オプション | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| I18n フレームワーク | localize (l) | - | DateTime オブジェクトを翻訳ファイルに設定した日付時刻のフォーマットに変換 | [8cb6cee](https://github.com/okapie/rails7-study/commit/8cb6cee59e0501c5e9ffae4ed047b68e4196e994) |

### Ruby

| 概念 / 機能 | メソッド | 演算子 | 処理 | コミット ID |
| :--- | :--- | :--- | :--- | :--- |
| 自己代入演算子 | - | ```a \|\|= xxx``` | a が 偽 か 未定義 なら a に xxx を代入 | [7760be6](https://github.com/okapie/rails7-study/commit/7760be625afdf74f23e9f23d427b3d6cefd56619) |
| 記号 ```?``` | - | ```def xx？``` | 真偽値を返すメソッド定義 | [7760be6](https://github.com/okapie/rails7-study/commit/7760be625afdf74f23e9f23d427b3d6cefd56619) |
