#!/bin/zsh
#Hydrate Kali with testing preferences and pentest repos
#Version 0.2.0
#Updated: 

# Function to echo text in blue
blue_echo() {
    echo -e "\033[34m$1\033[0m"
}

# Function to echo text in green
green_echo() {
    echo -e "\033[32m$1\033[0m"
}

# Function to echo text in red
red_echo() {
    echo -e "\033[31m$1\033[0m"
}

# Function to echo text in yellow
yellow_echo() {
    echo -e "\033[33m$1\033[0m"
}

# Function to echo text in purple
purple_echo() {
    echo -e "\033[35m$1\033[0m"
}

# ------ Root Checker ------
if [ "$EUID" -ne 0 ]; then
    red_echo "Error: " 
    echo "This script must be run as root. Use " 
    green_echo "sudo ./hydrate-2025.sh"
    echo "Exiting..."
    exit 1
fi

# ----- Kali Rehydrate Menu -----
version_number="v0.2.0"
blue_echo "
                                   .^                                
                                   :PB7                               
                                  :G!.PJ                              
                                 :B!   PY                             
                                ^B~     5Y                            
      ....::::::::.....        !B^       55                           
    ..:::^^~~!!!7??JJJJJJJ?7!~^J^         JP.                         
                 ...:::^~!7?JY555Y?!^..    7G:                        
       ..::^~!77?JJJYYYYYYYYYYYY5PGG#^..    7G.                       
  .:^~~!77777!!!~~~^^^^^^^~!7?JY55P5GJ..     JY                       
 .......          .:^!7JY55PP55YYJJJ!G7...    :::..                   
             .:~7JYYYJ?!~^YJ.........~#GYJ??7!~^^^~~^:                
         .^!7??7!^:.     ~#:     ..^?G&#BGPPGGBBGB5?J77~.             
       :^~~^:.          .B7     ..7#&Y!::.....:7B?YPBGB5J~..          
       .                YP     ..7@#~...       .B~ .:~?#@&J:.         
                       ^#:     .:G@J...         J5   ..~JP#P!^.       
                       5J      .:G@5:..         ~B       .:7P?.       
                      :#:      ..7&@J:..        :#.                   
                      ?G        ..!B@B?~:..     :#:                   
                      5J         ..:7P##BP5YJJJJJB?!!~^:..            
                      B!             .:~7?JJYYY5GGGB#&&BPY?7~:        
                      #^                       .G!.::~7J5GPJJYJ!.     
                      G!                       !B      ..^?PJ^~JY!    
                      YY                       G7         .:YG^.^J7   
                      ^#:                     JP           ..7G^..!^  
                       ?P                    7G.            . 75....  
                        JP:                 JP:                J~     
                         ~5J!^.          :75?                  :!     
                           ^!?JJ?7!!!!!?JJ!.                    :     
                                .:^~~~^:.                       :" 
purple_echo "   
    __ __ ___    __    ____                              
   / //_//   |  / /   /  _/                              
  / ,<  / /| | / /    / /                                
 / /| |/ ___ |/ /____/ /                                 
/_/ |_/_/ _|_/_____/___/  \033[32m______  ____  ___  ____________
   / __ \/ ____/ / / /\ \/ / __ \/ __ \/   |/_  __/ ____/
  / /_/ / __/ / /_/ /  \  / / / / /_/ / /| | / / / __/   
 / _, _/ /___/ __  /   / / /_/ / _, _/ ___ |/ / / /___   
/_/ |_/_____/_/ /_/   /_/_____/_/ |_/_/  |_/_/ /_____/   \033[93;1m$version_number   
"

# Display Menu
blue_echo "MENU:"
green_echo "[1] Start"
red_echo "[2] Exit"

# Get User Input
echo -n "Enter your choice: "
read choice

# Process User Choice
case $choice in
    1)
        blue_echo "Starting \033[35mKali \033[32mRehydrate..."

        # ----- Install packages and update/upgrade -----
        blue_echo "Installing gpg..."
        sudo apt-get install gpg

        blue_echo "Updating package lists..."
        sudo apt-get update -y -qq

        blue_echo "Upgrading installed packages..."
        sudo apt-get upgrade -y -qq

        blue_echo "Installing Python3.11-venv..."
        sudo apt install python3.11-venv

        blue_echo "dos2unix install..."
        sudo apt-get install dos2unix -y -qq

        blue_echo "Installing build essentials..."
        sudo apt install build-essential -y -qq

        blue_echo "Installing open-iscsi..."
        sudo apt-get install open-iscsi -y -qq

        blue_echo "Installing libkrb5-dev..."
        apt-get install libkrb5-dev -y -qq

        blue_echo "Configuring architecture for compatibility..."
        dpkg --add-architecture i386
        sudo apt update -y -qq

        blue_echo "Installing wine32 for 32-bit compatibility..."
        sudo apt -y install wine32:i386 -y -qq

        blue_echo "Installing Python 3 pip..."
        sudo apt-get install python3-pip -y -qq

        blue_echo "Installing pipx..."
        sudo apt-get install pipx -y -qq

        blue_echo "Installing DonPAPI..."
        sudo pipx install git+https://github.com/login-securite/DonPAPI.git

        blue_echo "Installing  golang-go..."
        sudo apt-get install golang-go -y -qq

        blue_echo "Installing Chromium..."
        sudo apt-get install chromium -y -qq
        
        blue_echo "Installing Docker and Docker Compose..."
        sudo apt update
        sudo apt install -y docker.io
        sudo systemctl enable docker --now
        sudo usermod -aG docker $USER
        echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list 
        curl -fsSL https://download.docker.com/linux/debian/gpg |
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo apt update
        sudo apt install -y docker-ce docker-ce-cli containerd.io

        blue_echo "Installing gcc..."
        sudo apt-get install gcc -y -qq

        blue_echo "Installing jq..."
        sudo apt-get install jq -y -qq
        
        blue_echo "Installing hostapd-wpe..."
        sudo apt-get install hostapd-wpe -y -qq

        blue_echo "Installing aircrack-suite..."
        sudo apt-get install aircrack-ng -y -qq

        blue_echo "Installing Impacket..."
        sudo apt-get install python3-impacket -y -qq

        blue_echo "Installing Impacket Scripts..."
        sudo apt-get install impacket-scripts -y -qq

        blue_echo "Installing Mingw-w64..."
        sudo apt-get install mingw-w64 -y -qq

        blue_echo "Installing Pure-FTPd..."
        sudo apt-get install pure-ftpd -y -qq

        blue_echo "Installing CrackMapExec..."
        sudo apt-get install crackmapexec -y -qq

        blue_echo "Installing Rinetd..."
        sudo apt-get install rinetd -y -qq

        blue_echo "Installing GCC-9 base, libgcc-9-dev, libc6-dev..."
        sudo apt-get install gcc-9-base libgcc-9-dev libc6-dev -y -qq

        blue_echo "Installing Terminator..."
        sudo apt-get install terminator -y -qq

        blue_echo "Installing SecLists..."
        sudo apt-get install seclists -y -qq

        blue_echo "Installing Steghide and Stegcracker..."
        sudo apt-get install steghide -y -qq
        sudo apt-get install stegcracker -y -qq

        blue_echo "Installing rlwrap..."
        sudo apt-get install rlwrap -y -qq

        blue_echo "Installing Veil..."
        sudo apt-get install veil -y -qq

        blue_echo "Installing Veil Evasion..."
        sudo apt-get install veil-evasion -y -qq

        blue_echo "Installing Shellter..."
        sudo apt-get install shellter -y -qq

        blue_echo "Installing Airgeddon..."
        sudo apt-get install airgeddon -y -qq

        blue_echo "Installing XRDP..."
        sudo apt-get install xrdp -y -qq
        sudo systemctl enable xrdp
        sudo systemctl start xrdp

        blue_echo "Installing and starting SSH..."
        sudo apt-get install ssh openssh-server -y -qq
        sudo systemctl enable ssh
        sudo systemctl start ssh

        blue_echo "Installing misc PIP3 tools..."
        pip3 install pandas openpyxl requests beautifulsoup4 stem tor shell-gpt xlsxwriter lolcat --break-system-packages

        blue_echo "Installing misc requirements..."
        dpkg --add-architecture i386
        sudo apt install jq scrot terminator wine wine32:i386 vmfs-tools kpartx libnss3-tools xclip

        blue_echo "Installing misc requirements continued..."
        go install github.com/takshal/freq@latest
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    
        #  ---- leafpad -----
        blue_echo "Installing leafpad..."
        sudo apt-get install leafpad 
        
        blue_echo "Installing npm..."
        sudo apt-get install npm -y -qq

        blue_echo "Installing AD-miner..."
        pipx install 'git+https://github.com/Mazars-Tech/AD_Miner.git'
        
        blue_echo "Installing Bloodhound-ce..."
        cd /opt/;
        sudo mkdir bloodhound-ce;
        cd /opt/bloodhound-ce;
        curl -L https://ghst.ly/getbhce >> docker-compose.yml;
        
        blue_echo "Updating package lists..."
        sudo apt-get update -qq

        blue_echo "Performing dist-upgrade..."
        sudo apt-get dist-upgrade -y -qq

        # ----- Tidy up -----
        blue_echo "Removing unnecessary packages..."
        sudo apt autoremove -y -qq

        # ------ git repositories.txt dos2unix clean-up ------------
        blue_echo "converting repository file dos2unix..."
        cd /opt/Kali-Rehydrate/
        dos2unix /opt/Kali-Rehydrate/repositories.txt
        
        # ----- Clone git repositories loop-----
        repositories_file="/opt/Kali-Rehydrate/repositories.txt"
        total_repositories=$(wc -l < "$repositories_file")
        current_repo_index=1

        if [ -f "$repositories_file" ]; then
            while read -r repo_url args; do
            
                repo_name=$(basename "$repo_url" .git)
                destination="/opt/$repo_name"

                echo "--------------------------------------------------------------------"
                blue_echo "Processing Git $current_repo_index of $total_repositories: $repo_url"
                
                if [ -d "$destination" ]; then
                    yellow_echo "Git repository already exists. Skipping..."
                else
                    git clone "$repo_url" "$destination" $args
                    green_echo "Git repository cloned successfully."
                fi

                ((current_repo_index++))
            done < "$repositories_file"
            echo "--------------------------------------------------------------------"
        else
            echo "Error: Repositories file not found."
        fi

        # ----- Setup bad characters txt file in /usr/opt/HackRepo ----
        blue_echo "Setting up Bad Characters File..."
        cd /opt/;
        if [[ -f "/opt/Kali-Rehydrate/badchars.txt" ]]
        then
            yellow_echo "badchars.txt already exists. Skipping..."
        else cp /usr/bin/badchars.txt /opt/Kali-Rehydrate/badchars.txt
        fi

        # ---- misc installs ------ 
        blue_echo "Installing gowitness..."
        blue_echo "This will be globally available..."
        sudo go install github.com/sensepost/gowitness@latest

        # ----- Pip Install Respositories -----
        blue_echo "Pip installing pycryptodome/cython/ssh-audit..."
        pip3 install pycryptodome --break-system-packages;
        pip3 install ssh-audit --break-system-packages;
        pip3 install cython --break-system-packages;
        
        # ----- Set executable permissions on git repos -----
        blue_echo "Setting up permissions..."
        chmod +x /opt/nmapAutomator/nmapAutomator.sh;
       
       # ----- Install BloodHound.py -----
       blue_echo "Installing BloodHound.py..."
       blue_echo "This is the only ingestor as of now that is compatible with bloodhound-ce..."
       cd /opt/;
       sudo git clone https://github.com/dirkjanm/BloodHound.py.git
       cd /opt/BloodHound.py/;
       pip3 install .

        # ---- windows-privesc-check ----
        blue_echo "Installing windows-privesc-check..."

        # ---- privilege-escalation-awesome-scripts-suite ---
        blue_echo "Installing privilege-escalation-awesome-scripts-suite..."

        # ----- ssh-badkeys -----
        blue_echo "Installing ssh-badkeys..."

        # ---- nishang -----
        blue_echo "Installing nishang..."

        # ---- mimipenguin -----
        blue_echo "Installing mimipenguin..."

        #  ---- netexec -----
        blue_echo "Installing netexec..."
        pipx install git+https://github.com/Pennyw0rth/NetExec;
        pipx ensurepath;

        #  ---- poetry -----
        blue_echo "Installing poetry..."
        pipx install poetry
        
        # ---- Install Impacket ----
        blue_echo "Installing Impacket..."
        cd /opt/impacket;
        pip3 install -r requirements.txt --break-system-packages;
        python3 -m pipx install impacket;
        pipx ensurepath;

        # ---- Install Dirsearch Requirements ----
        blue_echo "Installing Dirsearch..."
        cd /opt/dirsearch;
        pip3 install -r requirements.txt --break-system-packages;

        # ---- Install MS17-010 ----
        blue_echo "Installing MS17-010 Repo..."

        # ---- Install Kerbrute ----
        blue_echo "Installing Kerbrute..."

        # ---- Install php-reverse-shell ---- 
        blue_echo "Installing php-reverse-shell..."

        # ---- Install Gobuster ----
        blue_echo "Installing Gobuster..."

        # ---- Install Trustedsec-Unicorn ----
        blue_echo "Installing Trustedsec-Unicorn..."

        # Install wafw00f ----
        blue_echo "Installing wafw00f..."
        cd /opt/wafw00f;
        pipx install git+https://github.com/EnableSecurity/wafw00f.git;

        # ---- install pywerview ----
        blue_echo "Installing pywerview..."
        cd /opt/pywerview;
        pip3 install -r requirements.txt --break-system-packages;
        python3 -m venv venv;
        source ./venv/bin/activate;
        pip3 install -r requirements.txt --break-system-packages;

        # ---- Install NetRipper ---- 
        blue_echo "Installing NetRipper..."

        # ---- Install mimikittenz ----
        blue_echo "Installing mimikittenz..."

        # ---- Install Invoke-Obfuscation ---
        blue_echo "Invoke-Obfuscation..."

        # ---- Install autoNTDS ---
        blue_echo "Installing autoNTDS..."

        # ---- Install testssl.sh ----
        blue_echo "Installing testssl.sh..."

        # ---- Install ssh-audit ----
        blue_echo "Installing ssh-audit..."

        # ---- install mitm6 ----
        blue_echo "Installing mitm6..."
        cd /opt/mitm6;
        pip3 install -r requirements.txt --break-system-packages; 

        # ----- install empire -------
        blue_echo "Installing empire..."
        sudo chown kali:kali -R /opt/Empire;
        # ----Switching to kali user to install empire because empire cannot install or run as root. Enter Password For user kali which is just kali if it asks ----
        su kali
        cd /opt/Empire/setup;
        bash ./checkout-latest-tag.sh;
        cd ..
        bash ./ps-empire install -y;

        # ------- install Deathstar ---------
        blue_echo "Installing Deathstar..."
        cd /opt/DeathStar;
        pip3 install -r requirements.txt --break-system-packages;
        pipx install deathstar-empire;

        #---------------- install tailscale -----------------
        blue_echo "Uninstalling TailScale..."
        sudo tailscale down
        sudo apt-get remove --purge -y tailscale
        sudo apt-get autoremove -y

        blue_echo "Installing TailScale..."
        curl -fsSL https://tailscale.com/install.sh | sh;
        sudo apt-get update && sudo dpkg --configure -a;

        blue_echo "Configuring and Starting TailScale..."
        sudo systemctl enable --now tailscaled
        sudo tailscale up --ssh --advertise-tags=tag:ssh
    
        # ----- install nessus ------
        blue_echo "Installing Tenable Nessus..."
        cd /opt/ 
        curl --request GET \
        --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.8.3-ubuntu1604_amd64.deb' \
        --output 'Nessus-10.8.3-ubuntu1604_amd64.deb'
        dpkg -i Nessus-10.8.3-ubuntu1604_amd64.deb
        rm Nessus-10.8.3-ubuntu1604_amd64.deb
        sudo systemctl enable nessusd
        sudo systemctl start nessusd
      
        # ----- Install TeamViewer if not installed -----
        if ! command -v teamviewer &> /dev/null; then
            blue_echo "Installing TeamViewer..."
            wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
            dpkg -i teamviewer_amd64.deb
            apt-get install -f -y
            rm teamviewer_amd64.deb
        else
            yellow_echo "TeamViewer is already installed."
        fi

        # Display completion message
        green_echo "\033[35mKali \033[32mRehydration is complete. Kali's thirst has been quenched."
        ;;
    2)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting..."
        exit 1
        ;;
esac

