# aliases
alias ..="cd .. && pwd"
alias ls="exa -F"
alias la="exa -aF"
alias ll="exa -lF"
alias lla="exa -alF"

alias ga="git add"
alias gc="git checkout"
alias gs="git status"
alias gd="git diff"
alias gD="git diff --staged"
alias gl="git log --oneline --decorate --pretty=format:'%Cred%h%Creset %Cgreen%an%Creset %s (%Cblue%ar%Creset)'"
alias gL="git log --oneline --decorate --graph"
alias gp="git push origin HEAD"
alias gfp="git push --force-with-lease origin HEAD"
alias gr="git rebase --interactive"
alias grc="git rebase --continue"
alias gw="git worktree"
alias s="git show"
alias gss="git stash show -p"

alias c=cargo
alias tree="et --icons --sort size"
alias vi="nvim --clean"
alias vim=nvim
alias cat="bat --plain --theme zenburn"
alias rgf="rg --files-with-matches"

# environment variables
set -gx TERM screen-256color
set -gx EDITOR nvim
set -Ux RUST_BACKTRACE 1
set -Ux RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# paths
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/go/bin

# machine specific configurations
switch (uname)
    case Linux
        alias wezterm="flatpak run org.wezfurlong.wezterm"
        alias sound=alsamixer
    case Darwin
        set -x PATH $PATH /opt/homebrew/bin
        set -x PATH $PATH ~/opt/anaconda3/bin
        set -x PATH $PATH (brew --prefix)/opt/python/libexec/bin
    case '*'
end

function fish_greeting
    set os string join '.' (uname -s) (uname -m)

    echo " 🐟"
    echo -e ($os | awk '{print " \\\\e[1mos: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print " \\\\e[1mhostname: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uptime | sed 's/^up //' | awk '{print " \\\\e[1muptime: \\\\e[0;32m"$0"\\\\e[0m"}')

    set_color normal
end

# custom key bindings
bind \cd 'exit' # Exit the shell when Control+D is pressed

# This will run the mkdir command, and if it is successful, change the current
# working directory to the one just created.
function mkcd -d "create a directory and move into it"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function ssh
    set TERM xterm-256color
    command ssh $argv
end

function nvim
    set TERM wezterm
    command nvim $argv
end

zoxide init fish | source
starship init fish | source
