
# No Input Alias commands

# set-alias config git --git-dir=$HOME\\.cfg\\ --work-tree=$HOME $*

function config() {
    git --git-dir=$HOME\\.cfg\\ --work-tree=$HOME $args
}

# function dumbo($inargs) {
#     echo @inargs $*
# }
