#!/usr/bin/bash

log_info() 
{ 
    printf "\n\033[0;32m $* \033[0m\n\n";
    echo INFO: $* >> /tmp/bootstrap.log;
}

log_error() 
{ 
    printf "\n\033[0;31m $* \033[0m\n\n";
    echo ERROR: $* >> /tmp/bootstrap.log;
}

apt install -y dialog

clear

cat << "EOF"
					  
 mmmmm                    #           mmm 
 #   "#  mmm    mmm    mmm#  m   m   "   #
 #mmmm" #"  #  "   #  #" "#  "m m"    m#" 
 #   "m #""""  m"""#  #   #   #m#     "   
 #    " "#mm"  "mm"#  "#m##   "#      #   
			      m"          
EOF
sleep 1
cat << "EOF"
			    
  mmmm           m      mmm 
 #"   "  mmm   mm#mm   "   #
 "#mmm  #"  #    #      m#" 
     "# #""""    #      "   
 "mmm#" "#mm"    "mm    #   
EOF
sleep 1

#Prints metal gay
cat << "EOF"
                     
   [0;1;34;94mmmm[0m   [0;34mmmmm[0m    [0;34mm[0m   
 [0;34mm"[0m   [0;34m"[0m [0;34mm"[0m  [0;34m"m[0m   [0;37m#[0m   
 [0;34m#[0m   [0;34mmm[0m [0;37m#[0m    [0;37m#[0m   [0;37m#[0m   
 [0;37m#[0m    [0;37m#[0m [0;37m#[0m    [0;37m#[0m   [0;1;30;90m"[0m   
  [0;37m"mmm"[0m  [0;1;30;90m#mm#[0m    [0;1;30;90m#[0m   
                     
EOF
sleep .5

log_info \[1\/6\] Now installing main programs \(system basics\)...

apt install -y \
	unzip \
	unrar \
    nodejs \
    curl \
	wget 

log_info \[2\/6\] Now installing main programs \(productivity\)...
apt install -y \
    vim \
    tmux \
    mupdf \
    ranger \
    calcurse \
    gnome-tweaks

log_info \[3\/6\] Now installing main programs \(network and internet\)...
apt install -y \
    telnet \
    netcat \
    newsboat

log_info \[4\/6\] Now installing main programs \(graphics\)...
apt install -y \
    feh \
    imagemagick \
    scrot \
    ffmpeg \
    gimp \
    vlc

log_info \[5\/6\] Now installing main programs \(audio\)...
apt install -y \
    mediainfo 

log_info \[6\/6\] Now installing main programs \(devel\)...
apt install -y \
    git \
    python3-dev \
    python3-pip \
    python3-setuptools \
    jq \
    g++-10 \
    clang-12 \
    cppcheck \
    clang-tidy \
    clang-tidy-12 \
    ccache \
    moreutils

log_info Now installing secondary programs...
apt install -y \
    texlive-lang \
    biber \
    blender \
    transmission-cli \
    screenfetch \
    projectm-pulseaudio \
    cmatrix \
    firefox \
    qutebrowser \
    chromium

clear
