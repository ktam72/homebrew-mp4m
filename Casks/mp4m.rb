cask "mp4m" do
  version "3.1.0"
  sha256 "969c8587247cc18f8741e831e6068035c1ce055800a8fc0489e145fb84cb63e1"

  url "https://github.com/ktam72/mp4m-public/releases/download/#{version}/MP4M-#{version}.zip",
      verified: "github.com/ktam72/mp4m-public/"
  name "MP4M"
  desc "X68000 MDX music player"
  homepage "https://github.com/ktam72/mp4m-public"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "MP4M.app"

  zap trash: [
    "~/Library/Preferences/com.ktam.MP4M.plist",
    "~/Library/Saved Application State/com.ktam.MP4M.savedState",
  ]
end
