# homebrew-mp4m

[MP4M](https://github.com/ktam72/mp4m-public)（X68000 MDX プレイヤー）を Homebrew で配布するための tap です。

## インストール

```sh
brew install --cask ktam72/mp4m/mp4m
```

または tap を追加してから：

```sh
brew tap ktam72/mp4m
brew install --cask mp4m
```

## 初回起動について

MP4M は ad-hoc 署名のみで Apple の公証（notarization）を受けていないため、
そのままでは「"MP4M.app" は壊れているため開けません」と表示されます。
次のいずれかで回避してください。

インストール時に quarantine 属性を付けない：

```sh
brew install --cask --no-quarantine ktam72/mp4m/mp4m
```

インストール済みの場合は属性を外す：

```sh
xattr -dr com.apple.quarantine /Applications/MP4M.app
```

## 更新・アンインストール

```sh
brew upgrade --cask mp4m
brew uninstall --cask mp4m       # 設定ごと消す場合は brew zap --cask mp4m
```

## 動作環境

- macOS 14 (Sonoma) 以降
- Apple Silicon (arm64)
