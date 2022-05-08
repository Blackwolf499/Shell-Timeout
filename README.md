# Shell-Timeout
Shell-Timeout; a bash script that will terminate all shells at a pre-determined time. 
You can create exceptions for terminals you don't want terminated. 


[Versions]
- Full version: `idle_explosion.sh` 
- Minimal version: `silent_kill.sh` 


[Functionality]
`idle_explosion.sh`: 
- Size: 2,970 bytes
- Displays warnings for when the terminal will die
- Definable Grace period count-down.
- Definable time for when terminals will die
- Alerts when an exclusion has been found.  
- Controllable verbosity
- Comments included

`silent_kill.sh`:
- Size: 924 bytes
- Silent, no warning, no grace period. Only termination.
- The lighter version hogs far less resources:  
    - Reduced file size. No comments, no clutter, no noise.
    - Minimal memory consumption, no loops, sleeps till 1s prior to detonation time.

 
 
||=============== Installation Instructions ================||
Add these the following lines to your .zshrc or .bashrc.

`. path/to/file/idle_explosion.sh &` or `. path/to/file/silent_kill.sh &`

`alias disarm='touch /tmp/.zsh_exception/${PPID}; echo "Exception made."'`

||=================== General Information ===================||

This was a project that I was tasked to undertake, this is the finalised bash-script.
All terminals are killed with the SIGTERM flag, it terminates current sessions gracefully, 
Using SIGTERM will kill unresponsive terminal sessions but the history will not be saved as a result. 
 
