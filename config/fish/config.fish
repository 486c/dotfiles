if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $HOME/.cargo/bin $PATH
set EDITOR nvim

#export EDITOR=nvim

alias lg="lazygit"
alias ntr="cargo-nextest ntr"
alias ls="eza"
alias jpaste="wl-paste | jless"
