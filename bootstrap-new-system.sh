#!/usr/bin/env zsh

# A simple script for setting up OSX dev environment.


# Install Git-Extras
(cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)



dev="$HOME/Development"
pushd .
mkdir -p $dev
cd $dev

echo 'Enter new hostname of the machine (e.g. macbook-paulmillr)'
  read hostname
  echo "Setting new hostname to $hostname..."
  scutil --set HostName "$hostname"
  compname=$(sudo scutil --get HostName | tr '-' '.')
  echo "Setting computer name to $compname"
  scutil --set ComputerName "$compname"

echo 'Checking for SSH key, generating one if it does not exist...'
  [[ -f '~/.ssh/id_rsa.pub' ]] || ssh-keygen -t rsa

echo 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f '~/.ssh/id_rsa.pub' ]] && cat '~/.ssh/id_rsa.pub' | pbcopy
  open 'https://github.com/account/ssh'

# If we on OS X, install homebrew and tweak system a bit.
if [[ `uname` == 'Darwin' ]]; then
  which -s brew
  if [[ $? != 0 ]]; then
    echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
      brew update
      brew install htop mongodb mysql nginx node ruby
  fi

  echo 'Tweaking OS X...'
    source 'etc/osx.sh'
fi

echo 'Symlinking config files...'
  source 'bin/symlink-dotfiles.sh'

echo 'Applying sublime config...'
  st=$(pwd)/sublime/packages
  as="$HOME/Application Support/Sublime Text 2/Packages"
  asprefs="$as/User/Preferences.sublime-settings"
  if [[ -d "$as" ]]; then
    for theme in $st/Theme*; do
      cp -r $theme $as
    done
    rm $asprefs
    cp -r $st/pm-themes $as
    ln -s "$st/User/Preferences.sublime-settings" $asprefs
  else
    echo "Install Sublime Text http://www.sublimetext.com"
  fi

open_apps() {
  echo 'Install apps:'
  echo 'Firefox:'
  open http://www.mozilla.org/en-US/firefox/new/
  echo 'Dropbox:'
  open https://www.dropbox.com
  echo 'Chrome:'
  open https://www.google.com/intl/en/chrome/browser/
  echo 'Sequel Pro:'
  open http://www.sequelpro.com
  echo 'Skype:'
  open http://www.skype.com/en/download-skype/skype-for-computer/
  echo 'Pixelmator!'
  open http://www.pixelmator.com
}

echo 'Should I give you links for system applications (e.g. Skype, Tower, VLC)?'
echo 'n / y'
read give_links
[[ "$give_links" == 'y' ]] && open_apps

popd
