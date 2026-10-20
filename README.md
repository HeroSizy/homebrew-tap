# HeroSizy Homebrew Tap

**English** | [简体中文](README.zh-CN.md)

This tap contains the Homebrew casks of [MyTwig](https://github.com/HeroSizy/mytwig-releases), a native Git client for macOS, Windows and Linux.

## Install

```sh
brew install --cask herosizy/tap/mytwig
```

This command does the same as `brew tap herosizy/tap` and then `brew install --cask mytwig`. You must have macOS 12 Monterey or later, on Apple silicon or Intel. Homebrew selects the correct build.

**First launch.** MyTwig does not have an Apple Developer ID signature yet, and Apple did not notarize it yet. Homebrew puts a quarantine flag on the download, as a browser does. Thus, macOS blocks the first launch. To open MyTwig, do the procedure for your macOS version.

**macOS 15 Sequoia and later**

1. Open MyTwig.
2. Click **Done**.
3. Go to **System Settings → Privacy & Security**.
4. Click **Open Anyway**.

**macOS 12–14**

1. In **Applications**, Control-click MyTwig.
2. Select **Open**.
3. Click **Open**.

> **NOTE:** `brew upgrade` installs a new copy of MyTwig. Thus, you possibly must do the procedure again after an upgrade. The [install script](https://github.com/HeroSizy/mytwig-releases#install-with-one-command) does not cause this prompt.

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
