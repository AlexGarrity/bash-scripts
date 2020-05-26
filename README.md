# bash-scripts
Tiny script loader and a bunch of helper scripts

This is a small collection of helper scripts I use on my laptop.
They're pretty specific use cases but some could potentially have some uses.

To use them, just put all the loader into ~/.scripts then add the following to your `.bashrc`:
```bash
source ~/.scripts/LoadScripts.sh
LoadScripts
```

(There's probably a better way but they're tiny and too hacky for some proper method)


### Features
Automatically loads scripts in `~./.scripts` when you start a bash terminal.
Put #NOAUTOLOAD in the file and it won't source it (useful for helpers that are called by services or something like that)
Infinite loading capacity (well, as much as bash can handle)
Really small
Kinda neat I guess
