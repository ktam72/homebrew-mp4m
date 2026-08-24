cask "mp4m" do
  version "3.2.0"
  sha256 "a036307ddc87495b464907fa1eb6e167f9ef19ebbd2e946653fd7d1ebe4d0205"

  url "https://github.com/ktam72/mp4m-public/releases/download/#{version}/MP4M-#{version}.zip",
      verified: "github.com/ktam72/mp4m-public/"
  name "MP4M"
  desc "X68000 MDX music player"
  homepage "https://github.com/ktam72/mp4m-public"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "MP4M.app"

  zap trash: [
    "~/Library/Preferences/com.ktam.MP4M.plist",
    "~/Library/Saved Application State/com.ktam.MP4M.savedState",
  ]
end
