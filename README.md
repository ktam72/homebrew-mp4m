# homebrew-mp4m

[MP4M](https://github.com/ktam72/mp4m-public)（X68000 MDX プレイヤー）を Homebrew で配布するための tap です。

## ⚠️ インストール後に 1 コマンド必要です

MP4M は ad-hoc 署名のみで、Apple の公証（notarization）を受けていません。
Homebrew でインストールしたアプリには quarantine 属性が付くため、**そのまま起動すると
「"MP4M.app" は壊れているため開けません。ゴミ箱に入れる必要があります。」と表示されます。**
ファイルは壊れていません。macOS の Gatekeeper による拒否です。

## インストール

```sh
brew install --cask ktam72/mp4m/mp4m
xattr -dr com.apple.quarantine /Applications/mp4m.app
```

tap を追加してから入れる場合：

```sh
brew tap ktam72/mp4m
brew install --cask mp4m
xattr -dr com.apple.quarantine /Applications/mp4m.app
```

`xattr` の行を実行すれば、以降は普通に起動できます。

## 更新

**更新のたびに quarantine 属性が付き直すため、`xattr` も毎回実行してください。**
付け忘れると、それまで動いていたものが次回起動から「壊れている」と表示されます。

```sh
brew upgrade --cask mp4m
xattr -dr com.apple.quarantine /Applications/mp4m.app
```

## 「壊れているため開けません」と出てしまったら

上の `xattr` コマンドを実行するだけで起動できるようになります。
アプリを削除したり、ダウンロードし直したりする必要はありません。

```sh
xattr -dr com.apple.quarantine /Applications/mp4m.app
```

## アンインストール

```sh
brew uninstall --cask mp4m       # 設定ごと消す場合は brew zap --cask mp4m
```

## 動作環境

- macOS 14 (Sonoma) 以降
- Apple Silicon (arm64)

## よくある質問

**`--no-quarantine` オプションは使えませんか？**
Homebrew 6.x で廃止されました（`Error: invalid option: --no-quarantine` になります）。
現在は上記のとおり、インストール後に `xattr` で属性を外す方法をご利用ください。

**なぜ公証されていないのですか？**
公証には Apple Developer Program の Developer ID 署名が必要で、署名すると開発者の
本名と Team ID が配布物へ埋め込まれ、第三者が参照できる状態になります。
本プロジェクトはそれを避ける方針のため、ad-hoc 署名で配布しています。

**`xattr -dr com.apple.quarantine` は何をしていますか？**
「インターネットからダウンロードした」という隔離フラグを外し、Gatekeeper の拒否を回避します。
配布物の同一性は Homebrew が SHA-256 で検証しています。
配布元を信頼できない場合はインストールしないでください。
