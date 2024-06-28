# FIRST CONFIG FILES

* Edit `~/.bashrc` to add custom PS1.
* Create file `~/.bash_aliases` to store common alias. Add more if needed.
  * vi
  * vrc
  * brc
  * ba
  * cl
  * lla
* Create file `~/.vim/vimrc` and put the most wanted configs via defaults.vim.
* Configure the sets in vimrc file.
* Copy the plugins in $VIMRUNTIME/ftplugin to ~/.vim/plugin/ftplugin

Inside the file `~/.bashrc` add the custom $PS1 to shorten the cmd line
and restarts the shell to load the configs.

```bash
# Using WSL2
# Sets $PS1 to a short display
# i.g. "tuf@~$ " means user tuf at home dir (also /home/tuf)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\$ '

# Outside WSL2 this works for me
PS1='${PWD##*/} $ '
```

Create the `~/.bash_aliases` file to store most common alias

```bash
# vim
alias vi="vim -u NONE"
alias vrc="vim $HOME/.vim/vimrc"
alias brc="vim $HOME/.bashrc"
alias ba="vim $HOME/.bash_aliases"
alias bc="vim $HOME/.bash_configs"

# terminal
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lla="ls -lA"
alias cl="clear"
```

Inside the `vimrc` get the most wanted configs by default.

```bash
source $VIMRUNTIME/defaults.vim
```

Check the `vimrc` file with my configs (could be outdated...sorry :))
