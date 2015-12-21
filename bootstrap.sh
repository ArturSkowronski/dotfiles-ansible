#!/bin/bash

set -e

if [ "$1" == "-f" ]; then
    git add *
    git commit -m "New Version ${date}"
fi


# Download and install Command Line Tools with a checking heuristic
if [[ $(/usr/bin/gcc 2>&1) =~ "no developer tools were found" ]] || [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Info   | Update   | brew"
	brew update
fi

# Modify the PATH
export PATH=/usr/local/bin:$PATH

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info   | Install   | git"
    brew install git
fi

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    brew install ansible
fi

git pull
ansible-playbook main.yml --ask-sudo-pass

ln -s `pwd`/shell ~/.shell
ln -s `pwd`/rc/.zshrc ~/.zshrc
ln -s `pwd`/rc/.zprezto ~/.zprezto
legit install

