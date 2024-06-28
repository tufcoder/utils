# LINUX POST INSTALL COMMANDS

### Config the new user

username: foo  
password: 123  

### How change the hostname (WSL2)
https://datmt.com/linux/change-ubuntu-wsl2-hostname-permanently/

### Check and install updates

```bash
sudo apt update && sudo apt full-upgrade -y
```

### Install additional packages

```bash
sudo apt install build-essential git openssh -y 
```

### Configure SSH Key

```bash
ssh-keygen -t ed25519
ssh-keygen -t rsa -b 4096 -C "email@example.com"
ssh -T git@github.com
```

### Install ASDF Package Manager

Search for `asdf github` in the internet.  
<https://github.com/asdf-vm/asdf>  
Following the install steps.  

### Config aliases in the ~/.bashrc file

Update the `~/.bashrc` file or create a `~/.bash_aliases` file.  
I choose personally to create the `~/.bash_aliases` to store all additional
alias.  

```bash
# .bashrc
# Optional, turn terminal like vim
set -o vi

# .bash_aliases
alias cl=clear
```

Check **`vim.md`** file to more detailed information.
