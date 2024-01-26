#!/bin/zsh
#Hydrate Kali with testing preferences and pentest repos
#Version 0.1.1 
#Updated:Loops through git repositories included in a repositories.txt.
#        Add any github links to the .txt file and just loop through it!

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
repositories_file="repositories.txt"
total_repositories=$(wc -l < "$repositories_file")
current_repo_index=1

if [ -f "$repositories_file" ]; then
    while read -r repo_url args; do
    
        repo_name=$(basename "$repo_url" .git)
        destination="/usr/bin/$repo_name"

        echo "--------------------------------------------------------------------"
        echo "Processing Git $current_repo_index of $total_repositories: $repo_url"
        
        if [ -d "$destination" ]; then
            echo "$repo_name repository already exists. Skipping..."
        else
            git clone "$repo_url" "$destination" $args
        fi

        ((current_repo_index++))
    done < "$repositories_file"
else
    echo "Error: Repositories file not found."
fi

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