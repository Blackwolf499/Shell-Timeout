# Shell-Timeout
A bash script that will terminate all shells after a pre-determined amount of time. 
Creatable exceptions for each open terminal you don't want killed. 
If an exception is found the backgrounded script will immidately die.

I've created two versions:

- Full version: `idle_explosion.sh`
- Minimal version: `silent_kill.sh`

Full:
- Displays warnings for when the terminal will die
- Grace period, a count-down before the terminal is killed.
- Definable time-window for when terminals will die
- Alerts when an exclusion has been found.  
- Controllable verbosity
- Comments included

Minimal:
- Silent, no warning, no grace period. Only termination.
- The lighter version hogs far less resources:  
    - Reduced file size. No comments, no clutter, no noise.
    - Minimal memory consumption, no loops, sleeps till 3s prior to detonation time.


Add these two lines to your .zshrc or .bashrc.

`. path/to/file/idle_explosion.sh &`

`alias disarm='touch /tmp/.zsh_exception/${PPID}; echo "Exception made."'`

Was instructed to undertake this project, this is the polished product. 
