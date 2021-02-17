#!/bin/bash

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
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)
                echo "installing golang in vps"

wget https://golang.org/dl/go1.16.linux-amd64.tar.gz
sudo tar -xvf go1.16.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile		
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
					no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi

mkdir ~/tools
cd ~/tools

# install subfinder
echo "installing subfinder"
GO111MODULE=on
go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo"done"

# install assetfinder
echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo"done"

# install amass
echo"installing amass"
GO111MODULE=on 
go get -v github.com/OWASP/Amass/v3/...
echo"done"

# install github-subdomains
echo "installing github-subdomains"
go get -u github.com/gwen001/github-subdomains
echo"done"

# install shuffledns
echo"installing shuffledns"
GO111MODULE=on 
go get -v github.com/projectdiscovery/shuffledns/cmd/shuffledns
echo"done"

#install httpx
echo"installing httpx"
GO111MODULE=on 
go get -v github.com/projectdiscovery/httpx/cmd/httpx
echo"done"

#install aquatone
echo"installing aquatone"
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
mkdir aquatone
mv aquatone_linux_amd64_1.7.0.zip ~/tools/aquatone
unzip aquatone_linux_amd64_1.7.0.zip 
sudo mv aquatone /usr/local/go/bin
sudo rm -r aquatone_linux_amd64_1.7.0.zip
sudo rm -r ~/tools/aquatone

#install nuclei
echo"installing nuclei"
GO111MODULE=on 
go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei 
echo"done"

#install waybackurls
echo"installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo"done"

#install gf and gf patterns
echo "installing gf & gf patterns"
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir ~/.gf
sudo cp -r $GOPATH/src/github.com/tomnomnom/gf/examples/*.json ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json ~/.gf
sudo rm -r ~/tools/Gf-Patterns

