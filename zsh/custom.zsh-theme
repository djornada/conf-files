setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

if [[ $UID -ne 0 ]]; then
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f➤ %f'
else
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

local return_code="%(?..%F{red}%? ↵%f)"
local current_dir="%B%F{blue}%~%f%b"
local nvm_nodejs=''
if nvm &> /dev/null; then
  nvm_nodejs='%F{green}‹⬢ $(nvm version)›%f'
fi
local git_branch=' $(git_prompt_info)'

PROMPT="╭─ ${current_dir} ${nvm_nodejs}
╰─$PR_PROMPT "
RPROMPT="${git_branch} ${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹ "
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"

}
