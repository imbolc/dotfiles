# Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# sqlx 0.9 uses `anonymous` user by default
export PGUSER="$USER"

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Homebrew
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv sh)"
fi

# Snap
if [ -d /snap/bin ]; then
    PATH="/snap/bin:$PATH"
fi

# Cargo
if [ -r "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
    PATH="$PYENV_ROOT/bin:$PATH"
fi

# Android
JAVA_HOME=$(update-alternatives --query javac 2>/dev/null | sed -n -e 's/Best: *\(.*\)\/bin\/javac/\1/p')
# JAVA_HOME="/usr/lib/jvm/jdk-21.0.6-oracle-x64"
export JAVA_HOME

export ANDROID_HOME="$HOME/Android/Sdk"
if [ -d "$ANDROID_HOME" ]; then
    export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"
fi

if [ -d "$ANDROID_HOME/ndk" ] && ls "$ANDROID_HOME/ndk"/* >/dev/null 2>&1; then
    # Set to the last NDK directory (assuming version sorting)
    ANDROID_NDK_HOME=$(find "$ANDROID_HOME/ndk" -mindepth 1 -maxdepth 1 -type d | sort -V | tail -1)
    export ANDROID_NDK_HOME
fi

ANDROID_AVD_HOME=$HOME/.config/.android/avd
if [ -d "$ANDROID_HOME" ]; then
    export ANDROID_AVD_HOME
fi

# Load interactive Bash settings after the session environment is ready
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
