# HeroSizy Homebrew Tap

[English](README.md) | **简体中文**

[MyTwig](https://github.com/HeroSizy/mytwig-releases)（适用于 macOS、Windows 和 Linux 的原生 Git 客户端）的 Homebrew cask。

## 安装

```sh
brew install --cask herosizy/tap/mytwig
```

等同于先运行 `brew tap herosizy/tap`，再运行 `brew install --cask mytwig`。需要 macOS 12 Monterey 或更高版本，支持 Apple 芯片和 Intel（Homebrew 会自动选择对应版本）。

**首次打开。** MyTwig 目前没有使用 Apple 开发者 ID 签名，也未经 Apple 公证。Homebrew 会像浏览器一样给下载的文件加上隔离标记，所以 macOS 会拦截首次打开：

- macOS 15 Sequoia 及更高版本：打开 MyTwig，点按 **完成**，然后前往 **系统设置 → 隐私与安全性**，点按 **仍要打开**。
- macOS 12–14：在“应用程序”中按住 Control 键点按 MyTwig，选择 **打开**，再点按 **打开**。

`brew upgrade` 会安装一份新的副本，之后可能需要再做一次。使用[安装脚本](https://github.com/HeroSizy/mytwig-releases#一条命令安装)则完全不会出现这个提示。

## 更新

```sh
brew upgrade --cask mytwig
```

MyTwig 也会从签名的发布版本自行更新（**设置 → 通用 → 更新**）。该 cask 标记了 `auto_updates`，所以单独运行 `brew upgrade` 时会交给应用自己更新；在你运行上面的命令之前，`brew list --versions` 显示的仍是 Homebrew 安装的版本。

## 卸载

```sh
brew uninstall --cask mytwig          # 保留设置
brew uninstall --cask --zap mytwig    # 同时删除设置、缓存和日志
```

`--zap` 会删除 `~/Library/Application Support/MyTwig`、`~/Library/Caches/MyTwig` 和 `~/Library/Logs/MyTwig`。MyTwig 保存在钥匙串中的令牌不会删除；请先在 **设置 → 账户** 中退出登录，或在“钥匙串访问”中删除。

## 问题反馈

MyTwig 或此 cask 的问题请提交到 [MyTwig 的 Issues](https://github.com/HeroSizy/mytwig-releases/issues)。本仓库中的 cask 会在每次发布后自动更新。
