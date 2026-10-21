cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.2"
  sha256 arm:   "fd900e23b28334eed37fcf140ae0a6b4c3e953522eb77cceaa05ec7da0735e0f",
         intel: "35bc8c5a1ae7220fab9fe43a052c1ec1b2208ed55f92bd4a51ce6ba0d9132206"

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
