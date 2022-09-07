#!/bin/sh

set -ux

MODEL="$(sysctl -n hw.model)"
MACOS_VERSION="$(sw_vers -productVersion)"
DIRNAME="$MODEL/$MACOS_VERSION"

mkdir -p "$DIRNAME"

# All commands from bin that print version on stdout/err with --version are here
echo csh bash ksh sh zsh \
		| xargs -n1 -I% sh -c "/bin/% --version > $DIRNAME/%.version 2>&1"

echo vim make m4 screen bison flex python3 \
		| xargs -n1 -I% sh -c "test -x /usr/bin/% && /usr/bin/% --version >$DIRNAME/%.version 2>&1"

# Other commands with non-standard options are here
cd "$DIRNAME" || exit 1

/usr/bin/ssh -V 2> "ssh.version"

/usr/bin/sw_vers > "sw_vers"

/bin/launchctl version > "launchd.version"
/usr/bin/openssl version > "openssl.version"
/usr/bin/openssl ciphers > "openssl.ciphers"

