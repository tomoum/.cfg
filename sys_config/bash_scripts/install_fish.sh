#!/bin/bash

# Check to see if Homebrew is installed, and install it if it is not
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew..."; \
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }

# Update path to point to brew directory
profile_cmd='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
if grep -Fxq "$profile_cmd" /root/.profile
then
    # code found
    echo "profile eval already exists"
else
    echo $profile_cmd >> /root/.profile;
fi

# Update path for current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

# Install fish shell
brew install fish
