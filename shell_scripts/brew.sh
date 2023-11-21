# Installing the macOS developer tools required by brew
# xcode-select --install

# Actually installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Turing the automatic analytics off
brew analytics off

# Checking the brew installation for errors
brew doctor 2> ~/Documents/brew-error-log.txt

# Installing packages
brew install --cask firefox
brew install --cask brave-browser
# brew install --cask microsoft-teams
brew install --cask atom

read -p 'Do you want to install the Microsoft Suite? (y/n):' microPref

case "$microPref" in 
  y|Y ) brew install --cask microsoft-powerpoint; brew install --cask microsoft-excel; brew install --cask microsoft-word;;
  n|N ) echo "Microsoft Suite not installed. ";;
  * ) echo "invalid";;
esac

brew install --cask lulu
brew install --cask protonvpn
