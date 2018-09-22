#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install zsh
brew install zsh

brew install wget --with-iri

# Install MAS CLI
brew install mas

# Install Z 
brew install z

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install imagemagick --with-webp
brew install p7zip
brew install rename
brew install webkit2png
brew install zopfli

# Install Cask
brew install caskroom/cask/brew-cask

# Apps
apps=(
  1password
  alfred
  amazon-drive
  archiver
  atom
  bartender
  beardedspice
  carbon-copy-cloner
  chitchat
  dash-dash
  default-folder-x
  droplr
  firefox
  flux
  fluid
  forklift
  google-chrome
  hazel
  iconjar
  integrity
  imagealpha
  istat-menus
  iterm2
  lingo
  near-lock
  opera
  kaleidoscope
  phpstorm
  qbserve
  renamer
  rightfont
  sequel-pro
  sizeup
  sketch
  sketch-toolbox
  sketchbook
  slack
  sublime-text
  stay
  spotify
  totalfinder
  tower
  transmit
  tripmode
  xscope
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
defaults write com.apple.finder QLEnableTextSelection -bool true && killall Finder



# fonts

brew tap caskroom/fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-input
  font-source-code-pro
  font-source-sans-pro
  font-open-sans-condensed
  font-open-sans
  font-inconsolata
  font-fira-sans
)


# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

echo "Installing App Store Applications"
mas signin martinherweg@mac.com

# Fantastical (1.3.18)
mas install 435003921

# Todoist (6.3.17)
mas install 585829637

# Sip (4.4.1)
mas install 507257563

# Tweetbot (2.4.4)
mas install 557168941

# Deliveries (2.1.2)
mas install 924726344

# Affinity Designer
mas install 824171161

# Affinity Photo
mas install 824183456

# Boxy E-Mail Client
mas install 1053031090

# Copied
mas install 1026349850

# DaisyDisk
mas install 411643860

# tyme
mas install 1063996724

# bear
mas install 1091189122

# soulver
mas install 413965349

# jpegmini
mas install 498944723

# screenflow
mas install 1107828211

# iA Writer
mas install 775737590

# install global laravel installer
composer global require "laravel/installer"

# install laravel valet
brew install homebrew/php/php70
composer global require laravel/valet
brew install mariadb
brew services start mariadb

# Remove outdated versions from the cellar.
brew cleanup