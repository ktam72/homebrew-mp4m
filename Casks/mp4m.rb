cask "mp4m" do
  version "3.3.1"
  sha256 "5d5078de9a63ff6505f6a5061603eb2def8b73e1d4b69d9d06be98096a9c16ef"

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
