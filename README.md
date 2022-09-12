# macOS utils version matrix

This repository collects the versions/compilation parameters etc. of various
system utilities provided with the macOS system.

# Why?

Knowing the exact version of software present on different versions of OS is a powerful knowledge.

Developers can ensure that their required dependency is present on all of their target OS versions.

Security researchers can verify which OS versions contains vulnerable versions of a software.

And every user can `diff(1)` between two system versions to see what tools will be available after an update.

# Data organization

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

It allows for easy `diff(1)` between two different versions/machines.
Differences between various macs are likely to be minor x86 vs. arm builds, but it is not guaranteed.

The attached script should sample the versions on your machine and store them to their proper locations in the repository

# What to sample

This repository is intended for keeping track of the Apple provided binaries.
As such, versions of tools that are generally dependent on presence of other software should not be recorded here (unless some sane way is proposed). 
E.g. software that is installed by xcode or brew should not be here.

If you modify the `sample.sh` script, please use absolute paths to the executables as it is possible that multiple versions are installed (e.g. Homebrew loves to bring its own version of python) and we care only about the system binaries.

# Contributing

Contributions are welcome and needed.
If you would like any other tool to be sampled, please modify the sampling script to save it.

When you modify the `sample.sh` and then use it to produce `.version` files for the new software, please do so in separate commits.
I.e. do not mix changes to files in the root and to the actual "data" files.

You can contribute by submitting a patch to my email or by the standard GitHub fork/pull request workflow.
If you want to make my OCD really happy, please delete the fork after your changes are merged.

```bash
git clone git@github.com:vitkabele/macutils-version-matrix.git
cd macutils-version-matrix
./sample.sh
git add <changed files>
git commit # Describe your changes
git format-patch HEAD^ # Submit the file to my email (can be found in git log)
```

