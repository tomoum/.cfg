# .cfg
all my dotfiles configs, environment and application setup scripts

Instuctions for clonning 

Reference: https://www.atlassian.com/git/tutorials/dotfiles

1- `git clone --bare <git-repo-url> $HOME/.cfg`
2- git --git-dir=$HOME\\.cfg\\ --work-tree=$HOME checkout --force
  Note: the --force will delete will replace files that already exists be careful 
