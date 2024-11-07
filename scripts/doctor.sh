
#!/bin/zsh

# This script checks if the necessary commands are available in the system.

# Function to display text in bold
bold_text() {
    echo -e "\033[1m$1\033[0m"
}

# Function to display text in a specified color
color_text() {
    local color_code=$1
    shift
    echo -e "\033[${color_code}m$@\033[0m"
}

# Function to display text in green
green_text() {
    color_text 32 $1
}

# This function check if a command is available
check_command() {
    if command -v $1 &> /dev/null
    then
        echo -e "$(bold_text $1) at $(green_text $(command -v $1))"
    else
        echo -e "$(bold_text $1) could not be found"
    fi
}

# List of commands to check
commands=(
    "git"
    "nvim"
    "starship"
    "tmux"
    "brew"
    "code"
    "docker"
    "kubectl"
    "gcloud"
    "gh"
    "gpg"
    "bat"
)

# Check the availability of the commands
for command in "${commands[@]}"
do
    check_command $command
done

# Check if the UDEV Gothic font is installed
if [ -f "/Library/Fonts/UDEVGothicNF-Regular.ttf" ]; then
    echo -e $(bold_text "UDEV Gothic")" font is installed"
else
    echo -e $(bold_text "UDEV Gothic")" font is not installed"
fi
