# Shell-Timeout
A bash script that will terminate all shells after a pre-determined amount of time. 
Creating exceptions for each open terminal you don't want killed.

I've created two versions:
-`The full version: idle_explosion.sh
-The minimal version: silent_kill.sh

Full:
- Comments included
- Displays warnings for when the terminal will die
- Grace period, a count-down before the terminal is killed.
- Verbosity can be controlled if it's too verbose.

Minimal:
- Silent, no warning, no grace period. Only termination.
- The lighter version hogs far less resources:  
    - Reduced file size.
    - Minimal memory consumption, no loops.


Was instructed to undertake this project, this is the polished product. 
