#!/bin/bash
warning=10                                  
grace_period=3                              
detonation_time="2:00 am"                                                          
exception_dir="/tmp/.zsh_exception"    
mkdir $exception_dir > /dev/null 2>&1  

disarmed_check () { 
    bomb_disarmed=$(find $exception_dir -type f -name "${PPID}") 
}
countdown () { 
    bomb_timer=$(( $(date -d "$detonation_time" +%s) - $(date +%s) )) 
} 

nuclear_detonation () {
    while [ ! $bomb_disarmed ]; do
        disarmed_check; countdown
        if [ $bomb_timer -lt 3 ] || [ $bomb_timer -lt -3 ] && [ ! $bomb_disarmed ]; then
            disarmed_check
            if [ ! $bomb_disarmed ]; then
                $(kill -1 ${PPID}) exit;
            fi
        else
            sleep $(($bomb_timer -1))
        fi
    done
    exit;
} >&2
nuclear_detonation