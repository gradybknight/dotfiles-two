This repository is currently how I set up my mac as well as what I use to build a devcontainer. I'd like to use this as a starting point to create a set of dotfiles specific to a fedora machine. Here are the general requirements

- Create a new folder at the root of this directory called `fedora`
- Migrate the TMUX and NVIM configurations
- Make sure the configurations will work on a fedora machine
- TMUX specific changes
  - do not transfer the tmux-restore (or persist, I can't remember what its called). I do not want to restore the old sessions when restarting tmux
- NVIM specific changes
  - do not transfer the render-markdown extension. I don't like it
  - do not transfer `noice` as the notifications are intrusive and annoying
- Propose a method of setting the dotfiles on my fedora machine. I'm open to cloning the repo and using symlinks. Regardless of what method you choose, provide detailed setup instructions
