#!/bin/zsh
#Hydrate Kali with testing preferences and pentest repos

# ----- Set up directories -----

if [[ -d "/usr/bin/pip" ]]
then
    echo "Pip directory already exists! Skipping..."
else
mkdir /usr/bin/pip;
fi

# ----- Install packages and update/upgrade-----
sudo apt-get update && apt-get upgrade -y
dpkg --add-architecture i386 && apt update && apt -y install wine32:i386
apt-get install python3-pip
apt-get install -y docker.io
apt-get install docker-compose -y
apt-get install python3-impacket -y
apt-get install impacket-scripts -y 
apt-get install mingw-w64 -y
apt-get install pure-ftpd -y
apt-get install crackmapexec -y
apt-get install rinetd -y
apt-get install gcc-9-base libgcc-9-dev libc6-dev -y
apt-get install terminator -y
apt-get install seclists -y
apt-get install steghide -y
apt-get install stegcracker -y
apt-get install rlwrap -y
apt-get install bloodhound neo4j -y
apt-get install bloodhound.py -y
apt-get install veil -y
apt-get install veil-evasion -y
apt-get update && apt-get upgrade -y
apt-get dist-upgrade -y

# ----- Tidy up -----
apt autoremove -y

# ----- Clone git repositories -----
cd /usr/bin/;
git clone https://github.com/pentestmonkey/windows-privesc-check.git;
git clone https://github.com/21y4d/nmapAutomator;
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git;
git clone https://github.com/rapid7/ssh-badkeys.git;
git clone https://github.com/samratashok/nishang.git;
git clone https://github.com/huntergregal/mimipenguin.git;
git clone https://github.com/CoreSecurity/impacket.git;
git clone https://github.com/maurosoria/dirsearch.git --depth 1;
git clone https://github.com/worawit/MS17-010.git;
git clone https://github.com/ropnop/kerbrute.git;
git clone https://github.com/ivan-sincek/php-reverse-shell.git;
git clone https://github.com/OJ/gobuster.git;
git clone https://github.com/trustedsec/unicorn;
git clone https://github.com/EnableSecurity/wafw00f;
git clone https://github.com/the-useless-one/pywerview;
git clone https://github.com/NytroRST/NetRipper;
git clone https://github.com/orlyjamie/mimikittenz;
git clone https://github.com/danielbohannon/Invoke-Obfuscation;
git clone https://github.com/hmaverickadams/autoNTDS.git;
git clone --depth 1 https://github.com/drwetter/testssl.sh.git;
git clone https://github.com/jtesta/ssh-audit.git;
git clone https://github.com/dirkjanm/mitm6.git;
git clone --recursive https://github.com/BC-SECURITY/Empire.git;
git clone https://github.com/byt3bl33d3r/DeathStar.git;


# ----- Setup bad characters txt file in /usr/bin/HackRepo ----
cd /usr/bin/;
if [[ -f "/usr/bin/badchars.txt" ]]
then
    echo "badchars.txt already exists. Skipping..."
else cp /root/kali-hydration/badchars.txt /usr/bin/badchars.txt
fi

# ----- Set executable permissions on git repos -----
chmod +x /usr/bin/nmapAutomator/nmapAutomator.sh

# ----- Set up Pip Installer -----
cd /usr/bin/pip;
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py;
python3 get-pip.py;

# ----- Pip Install Respositories -----
pip install pycryptodome;

# ---- Install Impacket ----
cd /usr/bin/impacket;
pip3 install .;
python3 setup.py install;

# ---- Install Dirsearch Requirements ----
cd /usr/bin/dirsearcher;
pip3 install -r requirements.txt;

# ---- Enable Docker ----
systemctl enable docker --now;

# ---- install mitm6 ----
cd /usr/bin/mitm6;
pip3 install -r requirements.txt; 

# ----- install empire -------
cd /usr/bin/Empire;
./setup/checkout-latest-tag.sh;
./setup/install.sh;

# ------- install Deathstar ---------
cd /usr/bin/deathstar;
python3 -m pip install --user pipx;
pipx install deathstar-empire;











