#!/bin/bash

#####################################
##### Functions  &  Variables  ######
#####################################

#####  Change this accordingly  #####
warning=10                                  # This delays execution by n minutes.        (Default is 10 minutes)
grace_period=3                              # Final count-down in n seconds              (Attention grabbing, set to 0 to disable)
detonation_time="2:00 am"                   # .. Self explanatory...                     ( i hope. )                                        
exception_dir="/tmp/.zsh_exception"         # Directory to check for the exceptions      (make sure to change .zshrc alias too)
mkdir $exception_directory > /dev/null 2>&1 # Creates dir, pipes error to /dev/null      (to mute it if it already exists) 

#### alias disarm='touch /tmp/.zsh_exception/${PPID}; echo "\nTerminal PID: ${PPID} exempted.'   <-------  Copy & paste into .zshrc
disarm () {
    touch $exception_dir${PPID}
}
#### If PPID exclusion file found, disarms bomb. ####
disarmed_check () { 
    bomb_disarmed=$(find $exception_dir -type f -name "${PPID}") 
}
#### Epoch difference calculation. ####
countdown () { 
    bomb_timer=$(( $(date -d "$detonation_time" +%s) - $(date +%s) )) 
} 

#####################################
####### Shell Explosion Logic #######
#####################################

nuclear_detonation () {
    
### Explosion Conditionals ###
    while [ ! $bomb_disarmed ]; do
        # Run defuser_check func to update var, will do this each iteration.
        disarmed_check
        countdown
        
        # Time frame for when explosion will occur
        if [ $bomb_timer -lt 3 ] || [ $bomb_timer -lt -3 ] && [ ! $bomb_disarmed ] && [ $bomb_timer -gt -60 ]; then
            echo -e "[\n [Explosion in $warning minute(s)]\n"; 
            sleep $(($warning * 60))

        # Explosion Prevention grace period
            echo -e "You have 1 minute until nuclear detonation \n"; disarmed_check; sleep 60 
            echo -e "Terminal detonating in: \n"

        # Grace period count down
            while [ $grace_period -gt 0 ]; do
              echo "$grace_period..."; grace_period=$(($grace_period - 1))
              sleep 1
            done

        # Final check before terminating shell, remediates some edge cases.
            disarmed_check
            if [ ! $bomb_disarmed ]; then
                echo -e "KABOOOM!!! This shell has been nuked, terminating."; sleep 1

        # Sending SIGTERM to parent process for clean termination
        # Need to use SIGTERM instead of SIGKILL otherwise zsh history wont be saved
                $(kill -1 ${PPID})
                exit;
            fi
        fi
    done
    echo -e "\nException found, killing idle_explosion.sh"; exit;

## >&2 permits backgrounded bash script to pipe messages to the display.
} >&2

## We need this trigger to exec the func.
nuclear_detonation
