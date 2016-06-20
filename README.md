# dotfiles-for-designers

A dotfile repo that let you use CUI fluently. It is designed for, but not restricted to, designers at Increments.

## Install

```bash
curl -fsSL https://raw.github.com/increments/dotfiles-for-designers/master/script/install.sh | bash
```

Then create a `~/.gitconfig.local` as follows:

```
[user]
name = YOUR NAME
email = YOUR EMAIL
[github]
user = YOUR_GITHUB_ACCOUNT
```

## Commands

### dotfiles-sync

Sync dotfiles with remote server.

### git-work-logs

Output your activities in github.com to stdout in Markdown format. It is useful to write your daily log, a.k.a. 日報.

```
git-work-logs | pbcopy
```

## Zsh Keybindings

Some keybindings are installed. See zsh/zshrc/keybindings.zsh

- Ctrl-T -> jump to ghq directories.
- Ctrl-G + Ctrl-S -> git status

## Tools

### [rbenv](https://github.com/rbenv/rbenv)

Install Ruby 2.2.3 then use it globally:

```
rbenv install 2.2.3
rbenv global 2.2.3
```

### [nodebrew](https://github.com/hokaccha/nodebrew)

Install Node.js then use it globally:

```
nodebrew install-binary v6.2.0
nodebrew use v6.2.0
```
