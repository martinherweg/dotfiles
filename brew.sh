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

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install zsh
brew install zsh

# Install `wget` with IRI support.
brew install wget --with-iri


# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp --with-mysql

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install imagemagick --with-webp
brew install p7zip
brew install mysql
brew install php55-mcrypt
brew install rename
brew install speedtest_cli
brew install webkit2png
brew install zopfli

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# Install Cask
brew install caskroom/cask/brew-cask

# Apps
apps=(
  alfred
  dropbox
  google-chrome
  ColorpickerSkalacolor
  slack
  transmit
  coda
  firefox
  hazel
  spotify
  vagrant
  iterm2
  istat-menus
  sublime-text3
  virtualbox
  kaleidoscope
  atom
  sketch
  sequel-pro
  tower
  vlc
  quicklook-json
  skype
  ember
  soulver
  fantastical
  macpaw-gemini
  dash
  adobe-creative-cloud
  totalfinder
  droplr
  shortcat
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

#adding homestead as vagrant box
vagrant box add laravel/homestead

#require homestead globally with composer
echo "globally install homestead with composer"
composer global require "laravel/homestead=~2.0"

# install gulp
echo "installing gulp"
npm install --global gulp

#install bower
echo "installing bower"
npm install -g bower

# Remove outdated versions from the cellar.
brew cleanup