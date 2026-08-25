# homebrew-mp4m

[MP4M](https://github.com/ktam72/mp4m-public)（X68000 MDX プレイヤー）を Homebrew で配布するための tap です。

## ⚠️ 必ず `--no-quarantine` を付けてください

MP4M は ad-hoc 署名のみで、Apple の公証（notarization）を受けていません。
そのため **`--no-quarantine` を付けずにインストールすると、起動時に
「"MP4M.app" は壊れているため開けません。ゴミ箱に入れる必要があります。」と表示され、
アプリが起動しません**（ファイルは壊れていません。macOS の Gatekeeper による拒否です）。

## インストール

```sh
brew install --cask --no-quarantine ktam72/mp4m/mp4m
```

tap を追加してから入れる場合：

```sh
brew tap ktam72/mp4m
brew install --cask --no-quarantine mp4m
```

## 更新

**更新時も `--no-quarantine` が必要です。** 付け忘れると、それまで動いていたものが
次回起動から「壊れている」と表示されるようになります。

```sh
brew upgrade --cask --no-quarantine mp4m
```

## 「壊れているため開けません」と出てしまったら

`--no-quarantine` を付け忘れた場合や、`brew reinstall`（このオプションが使えません）を
使った場合は、次のコマンドで quarantine 属性を外せば起動できます。

```sh
xattr -dr com.apple.quarantine /Applications/mp4m.app
```

アプリを削除・再ダウンロードする必要はありません。

## アンインストール

```sh
brew uninstall --cask mp4m       # 設定ごと消す場合は brew zap --cask mp4m
```

## 動作環境

- macOS 14 (Sonoma) 以降
- Apple Silicon (arm64)

## よくある質問

**なぜ公証されていないのですか？**
公証には Apple Developer Program の Developer ID 署名が必要で、署名には開発者の
本名と Team ID が配布物へ埋め込まれ、第三者が参照できる状態になります。
本プロジェクトはそれを避ける方針のため、ad-hoc 署名で配布しています。

**`--no-quarantine` は安全ですか？**
ダウンロード元を信頼できる場合に、Gatekeeper の隔離フラグを付けずに配置するオプションです。
本 tap は GitHub Releases の zip を SHA-256 で検証したうえで展開します。
配布元を信頼できない場合はインストールしないでください。
