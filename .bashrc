# ~./bashrc: executed by bash(1) for non-login shells
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
#################################################
# The best bashrc in the observable universe    #
# v09072020 Allen Majewski                      #
# amajewski@5thcolumn.net                       #
# zsh? never heard of it			#
#################################################


# have you ever wanted colorized man pages?
# of course you have

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

# display memory used / memory avail in prompt cmd before PS1
export PROMPT_COMMAND='echo -en "\033[m\033[38;5;2m"$(( `sed -n "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[1;38;5;22m/"$((`sed -n "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB   ""' \

# display current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PROMPT_COMMAND='echo -en "\033[0;36m $(parse_git_branch) \033"'

# what box is this?
MACHINE_ID="shared"
# colorized PS1
export PS1="\[\033[0;91m\]\u\[\033[0;94m\]@\[\033[0;96m\]\h\[\033[0;99m\]:\[\033[0;93m\] < $MACHINE_ID > \n \[\033[0;97m\] \w \[\033[0m\]> "

# use vim for git checkout, not nano
export GIT_EDITOR=vim

# anaconda path
export PATH='/home/allen/anaconda3/bin':$PATH

# tar xzv wait ... its xjvf ... oh darnit
# Handy extract function
# unzips everything with one command
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

# flasher is cool, but not recommended
flasher () { while true; do printf \\e[?5h; sleep 0.1; printf \\e[?5l; read -s -n1 -t1 && break; done; }


HISTCONTROL=ignoreboth

# ls colors are cool
# get over it
#
# add your own. it is actually useful for checking
# large batch outputs e.g. a directory full of
# files names *.in, *.out
#
#  controls the colors of files by extension
LS_COLORS='di=96:fi=0:ln=33;100:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=92:*.rpm=90:*.deb=92:*.run=1;92:*.png=34:*.bmp=34:*.BMP=34:*.jpeg=94:*.jpg=94:*.JPG=94:*.JPEG=94:*.xcf=34:*.tiff=1;34:*.TIFF=1;34:*.gif=1;94:*.aux=90:*.bib=34:*.log=1;90:*.pdf=1;93:*.tex=33:*.zip=31:*.tgz=91:*.tar.gz=91:*.tar.bz2=91:*.exe=1;94;100:*.docx=1;94;100:*.doc=1;33:*.xlsx=1;94;100:*.xls=1;94;100:*.pptx=1;94;100:*.nb=31:*.math=91:*.m=31:*__pycache__=90:*.py=93:*.pyc=90:*.bash=92:*.sh=92:*.awk=94:*.rb=93:*.pl=93:*.c=31:*.h=91:*.cpp=36:*.f90=35:*.x=1;91*.o=32:*.md=33:*README=1;33:*LICENSE=33:*.txt=33:*.rtf=35:*.ipynb=1;33:*.mp3=31:*.mp4=31:*.avi=91:*.ogv=91:*.mov=91:*.xml=33:*.htm=33:*.html=33:*.js=93:*.css=34:*rc=32:*config=1;33:*akefile=1;91:*.in=32:*.out=31:*.xyz=34:*.sdf=1;34:*.mol=90:*.cif=94:*.CIF=94:*.pwi=32:*.pwo=31:*.ps=35:*.xsf=35:*.UPF=2:*.magres=36:*.sites=1;36:*.dat=37:*.  @info=1;92;100:*.show=1;95;101'

export LS_COLORS

##########################################
##      See color codes file .codes     ##
##########################################
     alias ls='ls --color=always'
     alias ll='ls -l'
     alias l='ls -CF'
     alias la='ls -la'
     # shortcut for finding files in dir
     alias igrep='grep -i'
     # shortcut to drop cahces / free up memory
     alias freemem='echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh'
     # like cat but wity color (linux only)
     alias dog='pygmentize -g'
     # redo last command with sudo... humorous reponse to \'are you root?\'
     alias please='sudo $(fc -ln -1)'
                # sure thing, install that package ... (ubuntu 16.x.x)
                alias ok='eval $($(fc -ln -1) 2>&1 | sed -n 2p)'
		# list every possible command imaginable
		alias cmdlist='compgen -abc -A function'
		# because lazy
                alias gimme='sudo apt-get install'
		# shout out to cmd.exe, but not really
		alias dir='ls -d */'

# only for grep power users
alias grep='grep --color=auto'
# ignore case
alias igrep='grep -i'
# supress colors
alias ngrep='grep --color=never'
alias nls='ls --color=never'
# git
# how to push when your house is on fire and you just dont have the
# time to write a good commit message
alias push='git add * && git commit -am "updates && git push"'

# because freedom
. .patriotismbot
