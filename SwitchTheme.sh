#!/bin/bash

#NOAUTOLOAD

function SwitchTheme() {
    CURRENT_HOUR=`date +%H`
    NEW_THEME="Sweet"
    
    if ((CURRENT_HOUR > 8)); then
        if ((CURRENT_HOUR < 21)); then
            NEW_THEME="com.github.vinceliuice.Canta-light"
        fi
    fi
    
    lookandfeeltool -a $NEW_THEME
}
