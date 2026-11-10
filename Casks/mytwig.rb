cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.0"
  sha256 arm:   "954f549daab7136308e5c5b8ff72ca07d2fc5c6a944afc399996f59f2980472e",
         intel: "9afd98d26bbf5a29a70b155cabdfc816f580b3824e8a67bed34a2e53d5735f87"

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
