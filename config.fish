if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path /usr/local/go/bin
    fish_add_path $HOME/dotnet
    fish_add_path $HOME/.dotnet/tools

    set DOTNET_ROOT $HOME/dotnet
    set EDITOR nvim
    set -g fish_greeting ""
    # set DISPLAY $(echo $(grep nameserver /etc/resolv.conf | awk '{print $2}'):0)

    # Vim shorthands to avoid using plain Vim
    alias vim="nvim"
    alias v='nvim'

    # Git aliases
    alias g='git'
    alias gs='git status'
    alias gd='git diff'
    alias ga='git add'
    alias gc='git commit'
    alias gcm='git commit -m'
    alias gca='git commit --amend'
    alias gl='git lg'
    alias gp='git push'
    # alias gsr='find . -type d -name ".git" | while read dir ; do sh -c "cd $dir/../ && git status -s | grep -q [azAZ09] && echo ---- ${dir//\.git/} ---- && git status -s" ; done'

    # Kubernetes aliases
    alias kc="kubectl"
    alias ns="kubens"
    alias ctx="kubectx"
    
    # Terraform aliases
    alias tsl='terraform state list'
    alias terraform="$HOME/.bin/terraform"
    alias tsr='terraform state rm'
    alias tss='terraform state show'
    alias ti='terraform import'

    # AWS PROFILE
    # alias awsp="/usr/local/bin/awsp && set -o allexport && source ~/.awsp && set +o allexport"
    function posix-source
        for i in (cat $argv)
            set arr (echo $i |tr = \n)
            set -gx $arr[1] $arr[2]
        end
    end
    function awsp
        /usr/local/bin/awsp
        posix-source ~/.awsp
    end
    
    # TMUX config
    alias ta="tmux attach"
    
    # fdfind
    alias fd="fdfind"

    alias ls="exa --icons --group-directories-first"

    function k --description 'List contents of directory, like ls but better'
        zsh -c ". $HOME/k/k.sh; k $argv"
    end

    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    starship init fish | source
end
