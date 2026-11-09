cask "mytwig" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm:   "4414528eae578289feecbbe13700a0d9d9f4936f121d73ebced7cbe85112cc7f",
         intel: "101e2892f876942b22abbd157e86aed05ae0010a338bdc5b57d7d9f85d2343eb"

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
