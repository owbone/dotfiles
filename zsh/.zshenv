# .zshenv is always sourced, define here exported variables that should
# be available to other programs.

export EDITOR=nvim
export PAGER=less

env_config_files=(~/.zsh/**/*.zshenv(N))
if test ! -z "$env_config_files" ;
    then
    for file in ${env_config_files}
    do
      source $file
    done
fi
