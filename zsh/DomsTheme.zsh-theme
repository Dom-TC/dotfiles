#Constants
# Terminal Themes
TERMINAL_THEME_DARK="Solarized Dark"
TERMINAL_THEME_LIGHT="Solarized Light"

# Git Themes
ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

# asdf Prompt Themes
ZSH_THEME_ASDF_PROMPT_PREFIX="%{$fg[yellow]%}{"
ZSH_THEME_ASDF_PROMPT_POSTFIX="}%{$reset_color%}"
ZSH_THEME_ASDF_PROMPT_FILTER="COMPACT"
ZSH_THEME_ASDF_PROMPT_VERSION_DETAIL="PATCH"

#Functions
# Print username when in ssh
function put_username() {
    if [[ -n $SSH_CONNECTION ]]; then
        echo "%n@"
    else
        echo ""
    fi
}

# Print file location shortened with '~'
function get_pwd() {
    echo "${PWD/$HOME/~}"
}

# Print required spacing for right alignment
function put_spacing() {
    # Calculate git charactors
    local git=$(git_prompt_info)
    if [ ${#git} != 0 ]; then
        ((git=${#git} - 10))
    else
        git=0
    fi

    # Calculate asdf_prompt_info charactors
    if has asdf; then
        local asdf=$(asdf_prompt_info)
        if [ ${#asdf} != 0 ]; then
            ((asdf = ${#asdf} - 18))
        else
            asdf=0
        fi
    fi

    # Calculate space neeeded
    local termwidth
    (( termwidth = ${COLUMNS} - ${#HOST} - ${#$(get_pwd)} - ${asdf} - ${git} - ${#$(put_username)} + 2))

    # Generate spacing
    local spacing=""
    for i in {1..$termwidth}; do
        spacing="${spacing} "
    done
    echo $spacing
}

# Print git info
function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Get Terminal Theme
function set_terminal_theme() {
    if has setTerminalTheme; then
        setTerminalTheme $TERMINAL_THEME_LIGHT $TERMINAL_THEME_DARK
    fi
}

# Set terminal dark mode - This needs updating for iTerm2
# set_terminal_theme

# Set Prompt
PROMPT='
$fg[cyan]$(put_username)%m: $fg[yellow]$(get_pwd)$(put_spacing)$(asdf_prompt_info) $(git_prompt_info) 
$reset_color%{$(iterm2_prompt_mark)%} '
