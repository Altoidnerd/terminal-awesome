# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)



### hip new beta version aliases ###

alias lesync='rsync'
alias lepush='rsync -avzr ~/.data/ hydra:~/.data/'
alias lepull='rsync -avzr hydra:~/.data/ ~/.data/'





# Headers
  
# use vim for git checkout, not nano
export GIT_EDITOR=vim

# Set PS1
#source "$PS1_PATH""$PS1_FILE"

# Handy extract function
function extract()      
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000

HISTFILESIZE=20000
# check the window size after each command and, if necessary,

# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color'
        LS_COLORS='di=96:fi=0:ln=33:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=92:*.rpm=90:*.deb=92:*.run=1;92:*.png=34:*.bmp=34:*.BMP=34:*.jpeg=94:*.jpg=94:*.JPG=94:*.JPEG=94:*.xcf=34:*.tiff=1;34:*.TIFF=1;34:*.gif=1;94:*.aux=90:*.bib=34:*.log=1;90:*.pdf=1;93:*.tex=33:*.zip=31:*.tgz=91:*.tar.gz=91:*.tar.bz2=91:*.exe=1;94;100:*.docx=1;94;100:*.doc=1;94;100:*.xlsx=1;94;100:*.xls=1;94;100:*.pptx=1;94;100:*.nb=31:*.math=91:*.m=31:*__pycache__=90:*.py=93:*.pyc=90:*.sh=32:*.rb=95:*.pl=1;94:*.c=31:*.h=91:*.o=32:*.md=33:*README=1;33:*LICENSE=33:*.txt=93:*.rtf=35:*.ipynb=1;33:*.mp3=31:*.mp4=91:*.mov=1;91:*.xml=34:*.htm=95:*.html=95:*.js=35:*.css=94:*rc=32:*config=1;32:*akefile=1;91:*.in=32:*.out=31:*.xyz=34:*.mol=90:*.cif=94:*.CIF=94:*.pwi=32:*.pwo=31:*.xsf=35:*.UPF=00;92;100'
       
        export LS_COLORS
                ##########################################
                ##      See color codes file .codes     ##
                ##########################################
                alias grep='grep --color=auto'
                alias fgrep='fgrep --color=auto'
                alias egrep='egrep --color=auto'
fi
                alias ll='ls -l'
                alias l='ls -CF'
                alias la='ls -la'
                alias vi='vim'
		# shortcut for finding files in dir
		alias igrep='grep -i'
                alias lsg='ls -la | igrep -n'
		alias lsgr='ls -laR | igrep -n'
		# shortcut to drop cahces / free up memory
                alias freemem='echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh'
                # colorized cat (linux only?)
                alias dog='pygmentize -g'
                # redo last command with sudo
                alias please='sudo $(fc -ln -1)'
                # sure thing, install that package ... (ubuntu)
                alias ok='eval $($(fc -ln -1) 2>&1 | sed -n 2p)'
		alias cmdlist='compgen -abc -A function'
                alias gimme='sudo apt-get install'
                alias tweak="source "$PS1_PATH"$PS1_FILE"
		alias 192='nmap -sP 192.168.0-1.0/24'
		alias count="lsg -c"
		alias dir='ls -d */'
                alias pub='chmod 755 *' # as in publish
                alias rpub='chmod -R 755 *'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# colored man pages, very nice
man() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                        man "$@"
}
# default cmd prompt defined in .bashrc

export PROMPT_COMMAND='echo -en "\033[m\033[38;5;2m"$(( `sed -n "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[1;38;5;22m/"$((`sed -n "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB   ""' \
export PS1='\[\033[1;33m\]\u\[\033[0;36m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w \[\033[1;96m\]\$ \[\033[0m\]'

