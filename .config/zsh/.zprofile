# Check if the system is macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Only set up Homebrew environment on macOS
  if which brew &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi
