function LoadScripts() {
    echo "Script Loader v1.2"
    
    for f in ~/.scripts/*.sh; do
        SHOULD_SOURCE="1"
        printf "\t%s\n" "Loading `echo $f | sed --expression='s|.sh||g' | sed --expression='s|\/.*\/||g'`"
        if grep -q "#NOAUTOLOAD" "$f"; then
            printf "\tTagged as no autoload - not running\n"
            SHOULD_SOURCE="0"
        fi
        if [ "$SHOULD_SOURCE"=="1" ]; then
            source "$f"
        fi
    done
    printf "\n"
    if [ "$1" != "-v" ]; then
        clear
    fi
}
