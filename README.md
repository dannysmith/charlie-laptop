# CharlieHR Laptop Script

Laptop install script for [CharlieHR](https://www.charliehr.com) engineers and designers.

## Configuring your laptop

First off, you should check basic some security settings...

1. Make sure you've set a strong basic password.
2. Turn on Touch ID if your laptop supports it.

Next, turn on FileVault and restart your laptop

```shell
sudo fdesetup enable
sudo shutdown -r now
```

Once you've rebooted, install the OSX command line tools and update the system

```shell
sudo softwareupdate -i -a; xcode-select --install
```

Now run the installation script

```shell
git clone https://github.com/spartaglobal/laptop.git $HOME/laptop
cd $HOME/laptop
chmod +x $HOME/laptop/install
$HOME/laptop/install
```

The script will tae a while to run. Once you have checked the output to ensure everything has been installed corrctly, type `yes` to restart your machine.

#### After the restart

Ensure you have been added to the CharlieHR GitHub organization and the *Contibutors* team.

Set your Github credentials

```shell
git config --global user.name "Your Name"
git config --global user.email "your_github_email@example.com"
```

Next, [generate your SSH keys and add them to GitHub](https://help.github.com/articles/connecting-to-github-with-ssh/)

```shell
ssh-keygen -t rsa -b 4096 -C "your_github_email@example.com"
eval "$(ssh-agent -s)"
```

Modify `~/.ssh/config` so it contains:

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```

Now run

```shell
ssh-add -K ~/.ssh/id_rsa
```

and [add your SSH key to GitHub](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account).

Run the following commands to clone the core Charlie projects into your `~/dev` directory:

```shell
git clone git@github.com:CharlieHR/Charlie.git ~/dev/charlie
git clone git@github.com:CharlieHR/charlie-widgeteer.git ~/dev/charlie-widgeteer
git clone git@github.com:CharlieHR/charlie-automaton.git ~/dev/charlie-automaton
git clone git@github.com:CharlieHR/charliehr-resources.git ~/dev/charliehr-resources
git clone git@github.com:CharlieHR/charliehr-blog.git ~/dev/charliehr-blog
```

Finally, ensure you've been added to the Charlie Heroku organization and login to heroku with:

```shell
heroku login
```

That's it.

#### Next Steps

Change into the Charlie repo (just run `charlie`) and follow the instructions in the README to get the app set up, then carry on with your onboarding process!

## What does the script do?

* Installs homebrew.
* Installs [all the software shown here](Brewfile).
* Installs Rbenv.
* Sets `bundler`, `pry`, `pry-doc` and `awesome_print` to install with every new version of ruby.
* Installs the latest stable version of ruby and the version currently being used by the main Charlie app.
* Copies some basic [dotfiles](assets/dotfiles) to your home directory.
* Installs NVM and the latest version of Node.
* Configures some basic macOS security settings.
* Configures some nice defaults for macOS.
* Copies the charlie desktop backgrounds to `~/Pictures`.
* Clears out the macOS dock.
* Sets Terminal.app to use the _Pro_ theme.

## TODO

* [ ] Actually test it out on a clean/reset laptop.
* [ ] Do we want to configure a nice vim setup by default (with [a theme, plugin manager and some basic plugins as a minimum](https://github.com/dannysmith/dotfiles/blob/master/vimrc)).
* [ ] Do we want to standardize on a default shell prompt for better pairing?
* [ ] Do we want to standardize on Zshell instead of bash?
* [ ] Check that it's actually idempotent - can we run it twice in a row without errors?

## Credits

Inspired by:

* [spartaglobal/laptop](https://github.com/spartaglobal/laptop) (by @dannysmith et al)
* [thoughtbot/laptop](https://github.com/thoughtbot/laptop)
