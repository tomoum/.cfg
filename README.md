# .cfg
all my dotfiles configs, environment and application setup scripts

Instuctions for cloning 

References: 
* https://www.atlassian.com/git/tutorials/dotfiles
* https://chocolatey.org/install

Manual Part:

1. Install choco using: `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`
2. `choco install bitwarden git gh -y`
3. sign in to github
4. `git clone --bare <git-repo-url> $HOME\.cfg`
5. `git --git-dir=$HOME\\.cfg\\ --work-tree=$HOME checkout --force`
  Note: the --force will delete will replace files that already exists be careful 
