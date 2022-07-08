#! /bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git figlet

#########################################################
figlet Instalando fish

FISH_FOLDER="${HOME}/.config/fish"
FISH_CONFIG="${FISH_FOLDER}/config.fish"
FISH_COMPLETIONS="${FISH_FOLDER}/completions"

# Limpando fish
sudo apt remove --purge -y fish
rm -rf $FISH_FOLDER

sudo apt install -y fish

mkdir -p $FISH_FOLDER
touch $FISH_CONFIG # Necessario para o grep do ASDF

sudo chsh -s $(which fish)

#########################################################
figlet Instalando starship

STARTSHIP_CMD="starship init fish | source"


wget https://starship.rs/install.sh 
chmod +x ./install.sh
./install.sh -y
rm ./install.sh

grep -qxF '$STARTSHIP_CMD' $FISH_CONFIG || echo $STARTSHIP_CMD >> $FISH_CONFIG

#########################################################
figlet Instalando asdf

ASDF_FOLDER="${HOME}/.asdf"
ASD_FISH_CONFIG="${ASDF_FOLDER}/asdf.fish"
ASD_COMPLETIONS="${ASDF_FOLDER}/completions"
ASDF_CMD="source ${ASD_FISH_CONFIG}"

# Limpando ASDF
sudo rm -rf $ASDF_FOLDER
sudo rm -rf $FISH_COMPLETIONS

git clone --quiet https://github.com/asdf-vm/asdf.git $ASDF_FOLDER

grep -qxF $ASDF_CMD $FISH_CONFIG || echo $ASDF_CMD >> $FISH_CONFIG

mkdir -p $FISH_COMPLETIONS
ln -s $ASD_COMPLETIONS/asdf.fish $FISH_COMPLETIONS

# Dependencias de build
sudo apt install -y python3 g++ make python3-pip \
make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

figlet Configuração finalizada

echo Feche o terminal e abra novamente e execute chmod +x ./tools.sh && ./tools.sh