#!/bin/zsh
#Hydrate Kali with testing preferences and pentest repos
#Version 0.1.6
#Updated: Fixed bug where Daemon outdate libraries constantly popped up.
#         Changed colors in logo and modularized colors

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

# Function to echo text in neon green
neon_green_echo() {
    echo -e "\033[38;5;82m$1\033[0m"
}

# ------ Root Checker ------
if [ "$EUID" -ne 0 ]; then
    red_echo "Error: " 
    echo "This script must be run as root. Use " 
    green_echo "sudo ./hydrate-2024.sh"
    echo "Exiting..."
    exit 1
fi

# ----- Kali Rehydrate Menu -----
version_number="v0.1.6"
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
echo "MENU:"
green_echo "[1] Start"
red_echo "[2] Exit"

# Get User Input
echo -n "Enter your choice: "
read choice

# Process User Choice
case $choice in
    1)
        echo "Starting Kali Rehydrate..."
        # ----- Set up directories -----
        pip_directory="/usr/bin/pip"
        if [ -d "$pip_directory" ]; then
            blue_echo "Pip directory already exists! Skipping..."
        else
            mkdir -p "$pip_directory" && green_echo "Pip directory created." || red_echo "Failed to create Pip directory."
        fi

                # ----- Install packages and update/upgrade -----
        green_echo "Updating package lists..."
        sudo apt-get update -y -qq

        green_echo "Upgrading installed packages..."
        sudo apt-get upgrade -y -qq

        green_echo "Configuring architecture for compatibility..."
        dpkg --add-architecture i386
        sudo apt update -y -qq

        green_echo "Installing wine32 for 32-bit compatibility..."
        sudo apt -y install wine32:i386 -y -qq

        green_echo "Installing Python 3 pip..."
        sudo apt-get install python3-pip -y -qq

        green_echo "Installing Docker and Docker Compose..."
        sudo apt-get install -y docker.io docker-compose -qq

        green_echo "Installing Impacket..."
        sudo apt-get install python3-impacket -y -qq

        green_echo "Installing Impacket Scripts..."
        sudo apt-get install impacket-scripts -y -qq

        green_echo "Installing Mingw-w64..."
        sudo apt-get install mingw-w64 -y -qq

        green_echo "Installing Pure-FTPd..."
        sudo apt-get install pure-ftpd -y -qq

        green_echo "Installing CrackMapExec..."
        sudo apt-get install crackmapexec -y -qq

        green_echo "Installing Rinetd..."
        sudo apt-get install rinetd -y -qq

        green_echo "Installing GCC-9 base, libgcc-9-dev, libc6-dev..."
        sudo apt-get install gcc-9-base libgcc-9-dev libc6-dev -y -qq

        green_echo "Installing Terminator..."
        sudo apt-get install terminator -y -qq

        green_echo "Installing SecLists..."
        sudo apt-get install seclists -y -qq

        green_echo "Installing Steghide and Stegcracker..."
        sudo apt-get install steghide -y -qq
        sudo apt-get install stegcracker -y -qq

        green_echo "Installing rlwrap..."
        sudo apt-get install rlwrap -y -qq

        green_echo "Installing Bloodhound and Neo4j..."
        sudo apt-get install bloodhound neo4j -y -qq

        green_echo "Installing Bloodhound.py..."
        sudo apt-get install bloodhound.py -y -qq

        green_echo "Installing Veil..."
        sudo apt-get install veil -y -qq

        green_echo "Installing Veil Evasion..."
        sudo apt-get install veil-evasion -y -qq

        green_echo "Updating package lists..."
        sudo apt-get update -qq

        green_echo "Performing dist-upgrade..."
        sudo apt-get dist-upgrade -y -qq

        # ----- Tidy up -----
        green_echo "Removing unnecessary packages..."
        sudo apt autoremove -y -qq

        # ----- Clone git repositories loop-----
        repositories_file="repositories.txt"
        total_repositories=$(wc -l < "$repositories_file")
        current_repo_index=1

        if [ -f "$repositories_file" ]; then
            while read -r repo_url args; do
            
                repo_name=$(basename "$repo_url" .git)
                destination="/usr/bin/$repo_name"

                echo "--------------------------------------------------------------------"
                green_echo "Processing Git $current_repo_index of $total_repositories: $repo_url"
                
                if [ -d "$destination" ]; then
                    yellow_echo "$repo_name repository already exists. Skipping..."
                else
                    git clone "$repo_url" "$destination" $args
                    blue_echo "$repo_name repository cloned successfully."
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
        green_echo "Kali Rehydration is complete. Kali's thirst has been quenched."
        green_echo "Launch TeamViewer using the command \"teamviewer\""
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

