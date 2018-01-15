fancy_echo "Updating NVM, Node and NPM..."

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

nvm install node
nvm install 8 # Charlie uses v8 of node
nvm install 6 # The blog uses v6 of node
nvm use node
node --version
npm update npm -g

green_echo "Done with Node/NPM installs!"
