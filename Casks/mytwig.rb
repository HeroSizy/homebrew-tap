cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "5ef04a432818c1d26d1dcceb29f7b62ce6a50e388a76ee71cde37c42b83bc787",
         intel: "66484d5b184d5c7f270602eccca2ec512ff24e33fe9dd58b8490304081bd1328"

  url "https://github.com/HeroSizy/mytwig-releases/releases/download/v#{version}/MyTwig.#{version}.#{arch}.dmg"
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
    MyTwig is not signed with an Apple Developer ID and not notarized by
    Apple (it has an ad-hoc signature only). Homebrew marks the download as
    quarantined, as a browser does, so macOS blocks its first launch:

      macOS 15 and later: open MyTwig, click Done, then go to
        System Settings > Privacy & Security and click Open Anyway.
      macOS 12 to 14: Control-click MyTwig in Applications, choose Open,
        then click Open.

    This may be needed again after `brew upgrade`, which downloads a new copy.

    MyTwig also updates itself from its own signed releases. Homebrew then
    keeps listing the version it installed; `brew upgrade --cask mytwig`
    brings it up to date.
  EOS
end
