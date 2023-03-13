mkdir "./config"
mkdir "./local"

# local
mkdir ./local/lv2
mkdir ./local/vst3
mkdir ./local/scripts
mkdir ./local/share
mkdir ./local/share/vitalium

# config
mkdir ./config/nvim

cp ~/run-sway .

cp -r ${HOME}/.config/nvim ./config/nvim
cp -r ${HOME}/.config/rofi ./config/

cp -r ${HOME}/.config/pipewire ./config/
cp -r ${HOME}/.config/i3 ./config/
cp -r ${HOME}/.config/sway ./config/
cp -r ${HOME}/.config/polybar ./config/
cp -r ${HOME}/.config/alacritty ./config/

cp -r ${HOME}/.local/lv2 ./local/
cp -r ${HOME}/.local/vst3 ./local/
cp -r ${HOME}/.local/scripts ./local/

cp -r ${HOME}/.local/share/vitalium ./local/share/

