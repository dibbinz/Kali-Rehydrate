#!/bin/zsh
#Hydrate Kali with testing preferences and pentest repos
#Version 0.1.2
#Updated:Added a Menu that also includes a Kali Rehydrate Logo in ASCII art. Options to start and stop in menu.

# ----- Kali Rehydrate Menu -----
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
                                .:^~~~^:.                       :     
    __ __ ___    __    ____                              
   / //_//   |  / /   /  _/                              
  / ,<  / /| | / /    / /                                
 / /| |/ ___ |/ /____/ /                                 
/_/ |_/_/ _|_/_____/___/  ______  ____  ___  ____________
   / __ \/ ____/ / / /\ \/ / __ \/ __ \/   |/_  __/ ____/
  / /_/ / __/ / /_/ /  \  / / / / /_/ / /| | / / / __/   
 / _, _/ /___/ __  /   / / /_/ / _, _/ ___ |/ / / /___   
/_/ |_/_____/_/ /_/   /_/_____/_/ |_/_/  |_/_/ /_____/   v0.1.2     
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