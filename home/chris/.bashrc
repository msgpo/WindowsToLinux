
### Zren
### http://stackoverflow.com/questions/4133904/ps1-line-with-git-current-branch-and-colors

# \e     an ASCII escape character (033)
# \]     end a sequence of non-printing characters
# \s     the  name  of  the shell, the basename of $0
#        (the portion following the final slash)
# \a     an ASCII bell character (07)
# \n     newline
# \[     begin a sequence of non-printing characters,
#        which could be used to embed a terminal con­
#        trol sequence into the prompt
# \w     the current working directory
### https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Colors
# \e[1      bold
# \e[4Xm    set background color X (0-7)
# \e[3Xm    set text color X (0-7)
# \e[m      reset text attributes
function __git_stuff {
  if [ -n "$(git rev-parse --git-dir 2>/dev/null)" ]; then
    local __a=`git name-rev --name-only @`
    echo "($__a) "
  fi
}
PS1_a='\e];\s\a\n'                # Cleanup?
PS1_b='\e[1m\e[36m$(__git_stuff)' # Git
PS1_c='\e[31m\w'                  # Working Dir
PS1_d='\e[m\n$ '                  # Prompt (on new line)
PS1="$PS1_a$PS1_b$PS1_c$PS1_d"
