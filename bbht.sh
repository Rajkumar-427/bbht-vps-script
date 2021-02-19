#!/bin/bash


echo "__________             __ __                                " 
echo "\______   \_____      |__|  | ____ __  _____ _____ _______  "
echo " |       _/\__  \     |  |  |/ /  |  \/     \\__  \\_  __ \ "
echo " |    |   \ / __ \_   |  |    <|  |  /  Y Y  \/ __ \|  | \/ "
echo " |____|_  /(____  /\__|  |__|_ \____/|__|_|  (____  /__|    "
echo "        \/      \/\______|    \/           \/     \/        "

#inspired by lazyrecon 

sudo apt-get -y update 
sudo apt-get -y upgrade 

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
#install go

wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -xvf go1.16.linux-amd64.tar.gz
sudo rm -r go1.16.linux-amd64.tar.gz
                                        sudo mv go /usr/local
                                        cp -r /usr/local/go /usr/bin/go
                                        export GOROOT=/usr/local/go
                                        export GOPATH=$HOME/go
                                        export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
                                        echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
                                        echo 'export GOPATH=$HOME/go'   >> ~/.bashrc            
                                        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc   
                                        source ~/.bashrc

mkdir ~/tools
cd ~/tools

# install subfinder
echo "installing subfinder"
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "done"

# install assetfinder
echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "done"

# install amass
echo "installing amass"
go get -v github.com/OWASP/Amass/v3/...
echo "done"

# install github-subdomains
echo "installing github-subdomains"
go get -u github.com/gwen001/github-subdomains
echo "done"

# install shuffledns
echo "installing shuffledns"
go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo "done"

#install httpx
echo "installing httpx"
go get -v github.com/projectdiscovery/httpx/cmd/httpx
echo "done"

#install aquatone
echo "installing aquatone"
mkdir ~/tools/aquatone
cd ~/tools/aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
mv aquatone_linux_amd64_1.7.0.zip ~/tools/aquatone
unzip ~/tools/aquatone/aquatone_linux_amd64_1.7.0.zip 
sudo cp -r ~/tools/aquatone/aquatone /usr/bin/
sudo rm -r ~/tools/aquatone/aquatone_linux_amd64_1.7.0.zip
echo "done"

#install nuclei
echo "installing nuclei"
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei 
echo "done"

#install waybackurls
echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

#install gf and gf patterns
echo "installing gf & gf patterns"
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir ~/.gf
sudo cp -r $GOPATH/src/github.com/tomnomnom/gf/examples/*.json ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json ~/.gf
sudo rm -r ~/tools/Gf-Patterns
echo "done"

#install hacks
echo "installing tomnomnom hacks"
git clone https://github.com/tomnomnom/hacks.git
echo "done"

#install gau
echo "installing gau"
go get -u -v github.com/lc/gau
echo "done"

#install ffuf
echo "installing ffuf"
go get -u github.com/ffuf/ffuf
echo "done"

#install dirsearch
echo "installing dirsearch"
cd ~/tools
git clone https://github.com/maurosoria/dirsearch.git
chmod +x dirsearch.py
pip3 install -r requirements.txt
echo "done"

#install relative-url-extractor
echo "installing relative-url-extractor"
cd ~/tools
git clone https://github.com/jobertabma/relative-url-extractor.git
chmod +x extract.rb 
echo "done"

#install linkfinder
echo "installing linkfinder"
cd ~/tools/
git clone https://github.com/GerbenJavado/LinkFinder.git
cd ~/tools/LinkFinder
pip3 install -r requirements.txt


#install secretfinder
echo "installing secretfinder"
git clone https://github.com/m4ll0k/SecretFinder.git secretfinder
cd ~/tools/Secretfinder
pip3 install -r requirements.txt

#install massdns
echo "installing massdns"
cd ~/tools
git clone https://github.com/blechschmidt/massdns.git
cp -r ~/tools/massdns/lists/resolvers.txt ~/resolvers.txt
echo "done"

#install seclists
echo "installing seclists"
cd ~/tools
git clone https://github.com/danielmiessler/SecLists.git
sudo cp -r  ~/tools/SecLists  ~/usr/share/
echo "done"

#install chromium
echo "installing chromium"
cd ~/tools
git clone https://github.com/scheib/chromium-latest-linux.git
cd ~/tools/chromium-latest-linux/
sudo ./run.sh
sudo ./update-and-run.sh
