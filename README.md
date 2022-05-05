# Shell-Timeout
A bash script that will terminate all shells after a pre-determined amount of time. 
Creating exceptions for each open terminal you don't want killed.

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
    - Minimal memory consumption, no loops, waits 3s prior to detonation time.


Was instructed to undertake this project, this is the polished product. 
