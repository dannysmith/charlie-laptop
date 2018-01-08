# Install Homebrew and required packages

HOMEBREW_PREFIX="/usr/local"

if [ -d "$HOMEBREW_PREFIX" ]; then # If the directory exists
  if ! [ -r "$HOMEBREW_PREFIX" ]; then # If it is not readable
    green_echo "Chowning $HOMEBREW_PREFIX to \"$(whoami):admin\"..."
    sudo chown -R "$(whoami):admin" "$HOMEBREW_PREFIX"
  fi
else
  sudo mkdir "$HOMEBREW_PREFIX"
  sudo chflags norestricted "$HOMEBREW_PREFIX"
  green_echo "Chowning $HOMEBREW_PREFIX to \"$(whoami):admin\"..."
  sudo chown -R "$(whoami):admin" "$HOMEBREW_PREFIX"
fi

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
fi

# Uninstall old homebrew cask if it exists
if brew list | grep -Fq brew-cask; then
  fancy_echo "Uninstalling old Homebrew-Cask..."
  brew uninstall --force brew-cask
  brew cleanup
  brew cask cleanup
fi

# Update Homebrew
fancy_echo "Running brew update..."
brew update
green_echo "done."

fancy_echo "Tapping Brewfile and installing bundle..."

# Tap brew-bundle
brew tap Homebrew/bundle

# Install everything in Brewfile
brew bundle
green_echo "done."

# Clear Up
fancy_echo "Cleaning Up..."
brew prune
brew cleanup
brew cask cleanup
brew doctor
brew cask doctor
green_echo "done."

green_echo "Done with homebrew installs!"
