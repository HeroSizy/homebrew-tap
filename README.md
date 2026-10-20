# HeroSizy Homebrew Tap

**English** | [简体中文](README.zh-CN.md)

Homebrew casks of [MyTwig](https://github.com/HeroSizy/mytwig-releases), a native Git client for macOS, Windows and Linux.

## Install

```sh
brew install --cask herosizy/tap/mytwig
```

This is the same as `brew tap herosizy/tap` followed by `brew install --cask mytwig`. It needs macOS 12 Monterey or later, on Apple silicon or Intel (Homebrew picks the right build).

**First launch.** MyTwig is not signed with an Apple Developer ID and not notarized by Apple yet. Homebrew marks the download as quarantined, as a browser does, so macOS blocks the first launch:

- macOS 15 Sequoia and later: open MyTwig, click **Done**, then go to **System Settings → Privacy & Security** and click **Open Anyway**.
- macOS 12–14: Control-click MyTwig in Applications, choose **Open**, then click **Open**.

You may need to do this again after `brew upgrade`, which installs a new copy. The [install script](https://github.com/HeroSizy/mytwig-releases#install-with-one-command) avoids the prompt altogether.

## Update

```sh
brew upgrade --cask mytwig
```

MyTwig also updates itself from its signed releases (**Settings → General → Updates**). The cask is marked `auto_updates`, so a plain `brew upgrade` leaves it to the app, and `brew list --versions` keeps showing the version Homebrew installed until you run the command above.

## Uninstall

```sh
brew uninstall --cask mytwig          # keeps your settings
brew uninstall --cask --zap mytwig    # also removes settings, caches and logs
```

`--zap` removes `~/Library/Application Support/MyTwig`, `~/Library/Caches/MyTwig` and `~/Library/Logs/MyTwig`. Tokens MyTwig saved in the Keychain stay; sign out in **Settings → Accounts** first, or remove them in Keychain Access.

## Problems

Report problems with MyTwig, or with this cask, in [MyTwig's issues](https://github.com/HeroSizy/mytwig-releases/issues). The cask in this repository is updated automatically after each release.
