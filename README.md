# HeroSizy Homebrew Tap

**English** | [简体中文](README.zh-CN.md)

This tap contains the Homebrew casks of [MyTwig](https://github.com/HeroSizy/mytwig-releases), a native Git client for macOS, Windows and Linux.

## Install

```sh
brew install --cask herosizy/tap/mytwig
```

This command does the same as `brew tap herosizy/tap` and then `brew install --cask mytwig`. You must have macOS 12 Monterey or later, on Apple silicon or Intel. Homebrew selects the correct build.

**First launch.** MyTwig has an Apple Developer ID signature and Apple notarized it, so macOS opens it at once.

## Update

```sh
brew upgrade --cask mytwig
```

MyTwig also updates itself from its signed releases (**Settings → General → Updates**). The cask has the `auto_updates` flag. Thus, a plain `brew upgrade` lets the app do the update. `brew list --versions` shows the version that Homebrew installed until you run the command above.

## Uninstall

```sh
brew uninstall --cask mytwig          # keeps your settings
brew uninstall --cask --zap mytwig    # also removes settings, caches and logs
```

`--zap` removes `~/Library/Application Support/MyTwig`, `~/Library/Caches/MyTwig` and `~/Library/Logs/MyTwig`.

> **NOTE:** `--zap` does not remove the tokens that MyTwig keeps in the Keychain. To remove them, click **Sign Out** in **Settings → Accounts** before you uninstall. You can also remove them in Keychain Access.

## Problems

Report problems with MyTwig, or with this cask, in [MyTwig's issues](https://github.com/HeroSizy/mytwig-releases/issues). After each release, an automatic process updates the cask in this repository.
