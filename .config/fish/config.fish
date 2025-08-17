if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun exports
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# default editor
set --export EDITOR nvim

alias vi=nvim
