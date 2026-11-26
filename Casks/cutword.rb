cask "cutword" do
  version "1.1.0"
  sha256 "8a3dd4044b0746be43f548f041ea9b920e2b541f4d1ab163113a5171a86c2134"

  url "https://github.com/wang-builds/cutword/releases/download/v#{version}/CutWord-#{version}-macos-arm64.dmg"
  name "CutWord"
  name "剪字"
  desc "Offline native macOS talking-head video editor — cut video by deleting words"
  homepage "https://github.com/wang-builds/cutword"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

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
