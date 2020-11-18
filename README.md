# Janilton's dotfiles, forked from Paul Irish.


## Setup
#### installing & using

* fork this to your own acct
* clone that repo
* read and run parts of `setup-a-new-machine.sh`
* read and run `symlink-setup.sh`
  * git config needs attention, read the notes.
* use it. yay!


#### shell

This repo contains config for bash, zsh, and fish. As of March 2016, I'm using fish shell mostly, but fall back to bash once in a while. The bash and fish stuff are both well maintained; zsh, less so. If you're using fish you'll want to do a `git submodule update --init`.


## overview of files

####  Automatic config
* `.inputrc` - behavior of the actual prompt line

#### fish environment
* `aliases.fish`
* `aliases_docker.fish`
* `config.fish`
* `bash_prompt`
* `functions.fish`
* `path.fish`
* `functions`
* `config.d`


#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`

#### manual run
* `setup-a-new-machine.sh` - random apps i need installed
* `symlink-setup.sh`  - sets up symlinks for all dotfiles and vim config.
* `.osx` - run on a fresh osx setup
* `brew.sh` & `brew-cask.sh` - homebrew initialization

#### git, brah
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`


### Sensible OS X defaults

Mathias's repo is the canonical for this, but you should probably run his or mine after reviewing it.

```bash
./.osx
```

### `~/bin`

One-off binaries that aren't via an npm global or homebrew. [git open](https://github.com/paulirish/git-open), [coloredlogcat](https://developer.sinnerschrader-mobile.com/colored-logcat-reloaded/507/), [git-overwritten](https://github.com/mislav/dotfiles/blob/master/bin/git-overwritten)



In order to automatically activate the virtualenv when cding to a project, do the following:
$ touch ~/.config/fish/conf.d/__auto_venv.fish
And paste the following:
function __auto_venv --on-variable PWD --description "Automatically activate python venv"
  set -l venv_name (basename $PWD | tr . -)

  if test -d $HOME/.virtualenvs/$venv_name
    source $HOME/.virtualenvs/$venv_name/bin/activate.fish
  end
end
