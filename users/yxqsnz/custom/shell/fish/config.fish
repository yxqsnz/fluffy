if [ (tty) = /dev/tty1 ]
    exec sway --verbose
end

# Command Not Found
function fish_command_not_found \
    --description 'Called by Fish when a command is not found'
    echo (set_color red)" [=]   Unknown:" $argv[1]
end

# Path
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
