# Set aliases
alias ..="cd .. && pwd"
alias ls="exa -F"
alias la="exa -aF"
alias ll="exa -lF"
alias lla="exa -alF"
alias tree="et --icons --sort size"
alias cat="bat --plain --theme zenburn"
alias vi="nvim --clean"
alias vim=nvim
alias c=cargo
alias gc="git checkout"
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline"
alias gL="git log --oneline --graph"
alias gp="git push origin HEAD"
alias gfp="git push --force-with-lease origin HEAD"
alias gw="git worktree"

# Set paths
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH ~/.local/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/go/bin

# Set environment variables
set -gx TERM screen-256color
set -gx EDITOR nvim
set -Ux RUST_BACKTRACE 1

# Set machine specific configurations
switch (uname)
    case Linux
        alias wezterm="flatpak run org.wezfurlong.wezterm"
        alias sound=alsamixer
    case Darwin
        set -x PATH $PATH /opt/homebrew/bin
        set -x PATH $PATH ~/opt/anaconda3/bin
        set -x PATH $PATH (brew --prefix)/opt/python/libexec/bin
        set -x PATH $PATH /run/current-system/sw/bin
        set -x PATH $PATH /etc/profiles/per-user/jungmin/bin
    case '*'
end

# Set custom key bindings
bind \cd 'exit' # Exit the shell when Control+D is pressed

# This will run the mkdir command, and if it is successful, change the current
# working directory to the one just created.
function mkcd -d "Create a directory and set CWD"
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

function fish_greeting
    set os string join '.' (uname -s) (uname -m)

    echo
    echo -e ($os | awk '{print " \\\\e[1mos: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uname -n | awk '{print " \\\\e[1mhostname: \\\\e[0;32m"$0"\\\\e[0m"}')
    echo -e (uptime | sed 's/^up //' | awk '{print " \\\\e[1muptime: \\\\e[0;32m"$0"\\\\e[0m"}')

    set_color normal
end

zoxide init fish | source
starship init fish | source
