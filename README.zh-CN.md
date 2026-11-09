# HeroSizy Homebrew Tap

[English](README.md) | **简体中文**

本 tap 包含 [MyTwig](https://github.com/HeroSizy/mytwig-releases)（适用于 macOS、Windows 和 Linux 的原生 Git 客户端）的 Homebrew cask。

## 安装

```sh
brew install --cask herosizy/tap/mytwig
```

该命令等同于先运行 `brew tap herosizy/tap`，再运行 `brew install --cask mytwig`。你必须有 macOS 12 Monterey 或更高版本，Apple 芯片或 Intel 均可。Homebrew 会选择对应的版本。

**首次打开。** MyTwig 带有 Apple 开发者 ID 签名并经过 Apple 公证，macOS 会直接打开它。

## 更新

```sh
brew upgrade --cask mytwig
```

MyTwig 也会从签名的发布版本自行更新（**设置 → 通用 → 更新**）。该 cask 带有 `auto_updates` 标记。因此单独运行 `brew upgrade` 时，由应用自己更新。在你运行上面的命令之前，`brew list --versions` 显示的仍是 Homebrew 安装的版本。

## 卸载

```sh
brew uninstall --cask mytwig          # 保留设置
brew uninstall --cask --zap mytwig    # 同时删除设置、缓存和日志
```

`--zap` 会删除 `~/Library/Application Support/MyTwig`、`~/Library/Caches/MyTwig` 和 `~/Library/Logs/MyTwig`。

> **注意：** `--zap` 不会删除 MyTwig 保存在钥匙串中的令牌。要删除它们，请在卸载前到 **设置 → 账户** 中点按 **退出登录**。你也可以在“钥匙串访问”中删除。

## 问题反馈

请把 MyTwig 或此 cask 的问题提交到 [MyTwig 的 Issues](https://github.com/HeroSizy/mytwig-releases/issues)。每次发布后，自动流程会更新本仓库中的 cask。
