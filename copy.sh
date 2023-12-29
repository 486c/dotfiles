mkdir "./config"
mkdir "./local"

# local
mkdir ./local/scripts

# config
mkdir ./config/nvim

cp ~/run-sway .
cp ~/.xinitrc .
cp ~/.tmux.conf .

cp -r ${HOME}/.config/nvim/* ./config/nvim/
cp -r ${HOME}/.config/rofi ./config/

cp -r ${HOME}/.config/pipewire ./config/
cp -r ${HOME}/.config/i3 ./config/
cp -r ${HOME}/.config/sway ./config/
cp -r ${HOME}/.config/polybar ./config/
cp -r ${HOME}/.config/alacritty ./config/

cp -r ${HOME}/.local/scripts ./local/

rm -rf ./config/nvim/shada
rm -rf ./config/nvim/plugin
