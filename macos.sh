################################
######      SECURITY      ######
################################

# Turn Firewall on
defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Turn stealth mode on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# Turn firewall logging on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on

# Set screensaver delay to 4 minutes
defaults write com.apple.screensaver idleTime -int 240

# Require password immediately when waking from screensaver
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable automatic login (if it happens to be on)
sudo defaults delete com.apple.loginwindow autoLoginUser

################################
######       GENERAL       #####
################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Set faster Key Repeat
defaults write -g KeyRepeat -int 1

# Disable press-and-hold and enable KeyRepeat instead
defaults write -g ApplePressAndHoldEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Copy desktop backgrounds
mkdir $HOME/Pictures/Backgrounds
cp $LAPTOP_INSTALL_DIR/assets/charlie-bg-large.png $HOME/Pictures/Backgrounds/charlie-bg-large.png
cp $LAPTOP_INSTALL_DIR/assets/charlie-bg-small.png $HOME/Pictures/Backgrounds/charlie-bg-small.png

# Set desktop background
# TODO: Doesn't work
# /usr/bin/osascript -e "tell application \"Finder\" to set desktop picture to \"$HOME/Pictures/Backgrounds/charlie-bg-small.png\" as POSIX file"

# Configure Dock
fancy_echo "Configuring dock..."
/usr/libexec/PlistBuddy -c "Add :magnification bool true" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Add :autohide bool true" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Delete :persistent-apps" ~/Library/Preferences/com.apple.dock.plist
/usr/libexec/PlistBuddy -c "Add :persistent-apps array" ~/Library/Preferences/com.apple.dock.plist

# Add new items to the dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
killall Dock

# Restart Finder
fancy_echo "Restarting Finder..."
killall Finder && open /System/Library/CoreServices/Finder.app

# Set Terminal Colors
fancy_echo "Configuring terminal..."
osascript <<EOD
  tell application "Terminal"
    set default settings to settings set "Pro"
    activate
  end tell
EOD
