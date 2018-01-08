# Copy over dotfiles
fancy_echo "Copying dotfiles..."
echo "(will not overwrite existing dotfiles)"
cp -rn $LAPTOP_INSTALL_DIR/assets/dotfiles/ $HOME/
fancy_echo "dotfiles done!"
