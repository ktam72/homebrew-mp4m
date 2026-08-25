cask "mp4m" do
  version "3.3.2"
  sha256 "ef0f90558767f920197c73eb29c5f1de3ace5afdfd2a3ee48b47d9ab67b3a8f5"

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
