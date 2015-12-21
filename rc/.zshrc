# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

. ~/.shell/variables.sh
. ~/.shell/functions.sh
. ~/.shell/aliases.sh
. ~/.shell/config/docker-machine.sh

autoload -Uz promptinit
promptinit
prompt steeef
init
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/arturskowronski/.sdkman"
[[ -s "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arturskowronski/.sdkman/bin/sdkman-init.sh"