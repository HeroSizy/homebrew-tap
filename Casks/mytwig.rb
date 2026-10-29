cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "1e0098c00ead50bdd7223754d359531d7da9d16e1841d4e5e2824cfce7efb71f",
         intel: "105b6a3087ecec9fb94641166df941861dfb7ebdff809dbff93ceb60133216f2"

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
