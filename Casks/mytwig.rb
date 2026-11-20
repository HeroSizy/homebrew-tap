cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.1"
  sha256 arm:   "d982d5bf5bdf04398fc19d27facd5b4df28eeb8e16ab2ae5c20932d7e72873e5",
         intel: "a2fe5b168102f333fcbfab785a50b3f94167b0b0fb20fe3b4befa12f9f56fde1"

  url "https://github.com/HeroSizy/mytwig-releases/releases/download/v#{version}/mytwig-#{version}-#{arch}.dmg"
  name "MyTwig"
  desc "Native Git client with a commit graph"
  homepage "https://github.com/HeroSizy/mytwig-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  # MyTwig updates itself in place (Settings > General > Updates).
  auto_updates true
  depends_on macos: :monterey

  app "MyTwig.app"

  uninstall quit: "com.herosizy.mytwig"

  # The forge and AI tokens MyTwig keeps in the Keychain stay: remove them
  # in Keychain Access, or sign out in Settings > Accounts first.
  zap trash: [
    "~/Library/Application Support/MyTwig",
    "~/Library/Caches/MyTwig",
    "~/Library/Logs/MyTwig",
    "~/Library/Preferences/com.herosizy.mytwig.plist",
    "~/Library/Saved Application State/com.herosizy.mytwig.savedState",
  ]

  caveats <<~EOS
    MyTwig also updates itself from its own signed releases. Homebrew then
    keeps listing the version it installed; `brew upgrade --cask mytwig`
    brings it up to date.
  EOS
end
