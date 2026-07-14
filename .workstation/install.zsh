#!/bin/zsh

# resolve this script's own directory so it can be run from anywhere
SCRIPT_DIR="${0:A:h}"

# git email - prompt early so it isn't missed behind the long brew install.
# ~/.gitconfig_local is git-ignored and included by ~/.gitconfig, overriding the
# `email = replace-me` placeholder. created once; edit the file to change it later.
GITCONFIG_LOCAL="$HOME/.gitconfig_local"
if [ ! -f "$GITCONFIG_LOCAL" ]; then
    printf "git email for this machine [blank = fill in later]: "
    read -r git_email
    : "${git_email:=replace-me@example.com}"
    cat >| "$GITCONFIG_LOCAL" <<EOF
[user]
	email = $git_email
EOF
    echo "wrote $GITCONFIG_LOCAL"
fi

# xcode - skip if command line tools are already installed
xcode-select -p &>/dev/null || xcode-select --install

# zprezto
git submodule update --init --recursive

# brew - keep everything current, then install anything missing from the Brewfile.
# brew bundle is idempotent (skips what's installed) and continues past failures.
brew update
brew upgrade
brew bundle --file="$SCRIPT_DIR/Brewfile"

# report drift: anything installed that the Brewfile does not list.
# add --force to actually uninstall the drift and make the Brewfile authoritative.
brew bundle cleanup --file="$SCRIPT_DIR/Brewfile"

# notunes - default to spotify, then keep it running at login via launchd.
# the cask only copies the app; it never launches it or sets it to start.
defaults write digital.twisted.noTunes replacement /Applications/Spotify.app
defaults write digital.twisted.noTunes hideIcon -bool true
xattr -dr com.apple.quarantine /Applications/noTunes.app 2>/dev/null
NOTUNES_PLIST=~/Library/LaunchAgents/digital.twisted.noTunes.plist
cat > "$NOTUNES_PLIST" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>digital.twisted.noTunes</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Applications/noTunes.app/Contents/MacOS/noTunes</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF
launchctl unload "$NOTUNES_PLIST" 2>/dev/null
launchctl load "$NOTUNES_PLIST"

# nvm - https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# default to showing hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder

# always show bluetooth in the menu bar (18 = show; controlled by Control Center)
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18
# show battery percentage in the menu bar
defaults write com.apple.controlcenter BatteryShowPercentage -bool true
killall ControlCenter

# pointer + scroll speed - max (takes effect after logout/restart)
defaults write -g com.apple.mouse.scaling -float 3.0        # mouse tracking
defaults write -g com.apple.trackpad.scaling -float 3.0     # trackpad tracking
defaults write -g com.apple.scrollwheel.scaling -float 3.0  # mouse scroll wheel

# enable right-click on magic mouse
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string TwoButton

# enable three-finger drag on trackpad (move windows with three fingers)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# stop the mac play/pause key from controlling chrome tabs
# (equivalent to chrome://flags -> hardware-media-key-handling = Disabled)
# stored in Chrome's Local State JSON, not `defaults`. runs only if not already set;
# Chrome must be quit first or it rewrites the file on exit. takes effect next launch.
CHROME_STATE="$HOME/Library/Application Support/Google/Chrome/Local State"
CHROME_MEDIA_FLAG="hardware-media-key-handling@2"
if [ -f "$CHROME_STATE" ] && ! grep -q "$CHROME_MEDIA_FLAG" "$CHROME_STATE"; then
    osascript -e 'quit app "Google Chrome"' 2>/dev/null
    tmp="$(mktemp)"
    jq --arg f "$CHROME_MEDIA_FLAG" \
        '.browser.enabled_labs_experiments = ((.browser.enabled_labs_experiments // []) + [$f] | unique)' \
        "$CHROME_STATE" >| "$tmp" && mv -f "$tmp" "$CHROME_STATE"
fi

# done
open -a iterm
