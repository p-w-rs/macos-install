# ~/.bashrc

# Set default prompt: user@host:working_dir$
PS1='\u@\h:\w$ '

# Optional: Color prompt (uncomment for green text)
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '

# Load custom bash configuration if it exists
if [[ -f "$HOME/.config/bash/config.sh" ]]; then
    source "$HOME/.config/bash/config.sh"
fi
