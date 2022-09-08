# macOS utils version matrix

This repository collects the versions/compilation parameters etc. of various
system utilities provided with the macOS system.

The repository structure is following:

```
|- README.md
|- sample.sh
|- MacBookPro13,2
|	|- hardware.version
|	|- 12.5.1
|	|	|- bash.version
|	|	|- ssh.version
|	|	|- zsh.version
|	|	|- ...
|- <mac model>
|	|- <macOS version>
|	|	|- <tool>.version
```

The attached script should sample the versions on your machine and stores them
to their proper locations in the file hierarchy.

# What to sample

This repository is intended for keeping track of the Apple provided binaries.
As such, versions of tools that are generally dependent on presence of other
software should not be recorded here (unless some sane way is proposed). 
E.g. software that is installed by xcode or brew should not be here.

If you modify the sample.sh script, please use absolute paths to the executables,
it is possible that multiple versions are installed (e.g. Homebrew loves to 
bring its own version of python) and we care about the system binaries.

# Contributing

Contributions are welcome. If you have a mac, then clone -> run -> push.
Also just some binaries are sampled. If you miss any in the log, please modify
the sampling script to save the version in the future.


