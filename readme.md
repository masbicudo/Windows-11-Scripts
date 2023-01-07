# Windows 11 Scripts

These scripts are made to setup my Windows environment to my needs.
Anyone can use this repo as a basis to other kinds of setups as they see fit.
This code is provided as is.

## Basic Install

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex "$Force=$true;"+((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/masbicudo/Windows-11-Scripts/master/basic-install.ps1'))
```

The basic installation script will install the first needed tools to make further modifications to the system:

- Chocolatey
- Git
  - Install
  - Setup User
- SSH: create id_rsa
- GitHub: use SSH key
- Create Projects folder at `D:\Projects`
- Checkout `Windows-11-Scripts` inside that folder

## Common Install

Common installation steps are those that are present on all my environments.
These include the placement of special folders, and some basic tools to deal
with files and some dev tools.

All steps are optional, such that the script will ask whether to do it or not.

- Move Desktop and Downloads folder to `D:\`
- Install basic file tools
  - Everything Search
  - GrepWin
  - Link Shell Extensions
- Install basic dev tools
  - DotNet 6 and 7
  - VS Code
  - GitExtensions
  - WinMerge

## Clone My Projects

This is used to clone my projects into D:\Projects directory.
If some project is already cloned then it will be skipped.

