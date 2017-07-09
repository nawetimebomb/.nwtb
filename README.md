# .nwtb [nawetimebomb profiler]

## Introduction

This repository contains my main configurations. All my machines are running UNIX-like
systems so to keep all these boxes consistent I pulled a collection of
useful standards.

## Dependencies

As this is an early version it needs a lot of stuff to run (because I actually
use all these things). I want to move to a more configurable approach in the
future and reduce the amount of dependencies.

- Git
- Bash (v4+)
- Emacs
- Tmux

## `TODOs`

This section is here because even though I spent most of my life behind a
monitor, I sometimes don't have that much time to update OS-configuration files
so I just list all the things I need to do here.

- Get Emacs configuration in this repository.
  [(.emacs.d repository)](https://github.com/elnawe/.emacs.d "Go to Emacs configuration repository: /elnawe/.emacs.d")
- Make submodules self-installable.
- Get `w3m` configuration in this repository.

## Installation

### Step 1: clone this repository.

I created an `install.sh` file that will make the installation super easy.
Though you've to have in mind I'm using some currently existing packages as git
submodules. So, at the time you clone this repo, you should use `--recursive`.

    git clone --recursive https://github.com/elnawe/.nwtb.git ~/.nwtb

- **Notes:**

-- You should use `~/.nwtb` as the clone path. If not, at the time you run
`install.sh` the folder will be moved to `~/.nwtb`. For consistency I use the
same path on all my machines.
-- `--recursive` is to clone all the git submodules. If you do not use
this option you will not have the packages configuration (don't worry,
installation won't fail). If you forgot about `--recursive` but you still want
these packages you can do

    $ git submodules init
    $ git submodules update

### Step 2: run the installation script

You just have to execute `install.sh` doing

    $ <installation_path>/install.sh

This script will be taking care of looking for your `bash configuration file`
(first looking for `~/.bash_profile`, if doesn't exist goes to `~/.bashrc`) and
add the `source` line to `.nwtb/profile.sh`. `profile.sh` is the one that has
the standards and the configurations.

### Step 3: restart the terminal

If you are on X/GUI just close all the terminal emulators and then execute one
of them again. If you are on a `TOS` or `CLI-only` then `logout` of your
terminal and that should be ok.

## Tips

- This is not fully configurable yet so you might want to change some of the
options by editting `profile.sh` or any other `sh` file. Feel free.
- You can contribute with anything, just open a PR with your changes!

## Copyright

This is licensed `GNU GPL`.

Copyright (C) 2017, Nahuel Jesús Sacchetti hello@elnawe.com http://elnawe.com.
