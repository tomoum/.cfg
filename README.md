# .cfg
all my dotfiles configs, environment and application setup scripts

Instuctions for cloning 

Reference: https://www.atlassian.com/git/tutorials/dotfiles
Manual Part:
1- Install choco
2- install bitwarden and git with choco
3- sign in to github
4- `git clone --bare <git-repo-url> $HOME\.cfg`
5- `git --git-dir=$HOME\\.cfg\\ --work-tree=$HOME checkout --force`
  Note: the --force will delete will replace files that already exists be careful 
