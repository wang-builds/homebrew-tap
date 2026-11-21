cask "cutword" do
  version "1.0.0"
  sha256 "b5a8b62a7f0dfce5fcde2c5280aba7911844fcd0924120fb149be5fae07488de"

  url "https://github.com/wang-builds/cutword/releases/download/v#{version}/CutWord-#{version}-macos-arm64.dmg"
  name "CutWord"
  name "剪字"
  desc "Offline native macOS talking-head video editor — cut video by deleting words"
  homepage "https://github.com/wang-builds/cutword"

  depends_on arch: :arm64

  app "CutWord.app"
  binary "#{appdir}/CutWord.app/Contents/MacOS/cutword"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CutWord.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.wangbuilds.cutword.plist",
    "~/Library/Saved Application State/com.wangbuilds.cutword.savedState",
  ]
end
