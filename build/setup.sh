# homebrew
export PATH="/usr/local/bin:$PATH"
export HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_CELLAR="/usr/local/Cellar"
export HOMEBREW_REPOSITORY="/usr/local/Homebrew"

# gcc
export CC="gcc-13"
export CXX="g++-13"
alias cc="$CC" # remember, kids---always use $CC

# flex
export PATH="/usr/local/opt/flex/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/flex/lib"
export CPPFLAGS="-I/usr/local/opt/flex/include"

# bison
export PATH="/usr/local/opt/bison/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bison/lib"
