fancy_echo "Updating NVM, Node and NPM..."

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

nvm install node
nvm use node
node --version
npm update npm -g

green_echo "Done with Node/NPM installs!"
