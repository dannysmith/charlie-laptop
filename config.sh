fancy_echo() {
  local fmt="$1"; shift
  printf "\n\e[95m$fmt\e[97m\n\n" "$@"
}

green_echo() {
  local fmt="$1"; shift
  printf "\n\e[92m$fmt\e[97m\n" "$@"
}

input_echo() {
  local fmt="$1"; shift
  printf "\e[33m$fmt\e[97m " "$@"
}

# Get admin password
echo "Type the administrators password for your laptop..."
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
