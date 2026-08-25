cask "mp4m" do
  version "3.3.3"
  sha256 "3b2194ea8b3518a709d37d507138120a5203d1f51e44793e62f04b6262fe1179"

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
