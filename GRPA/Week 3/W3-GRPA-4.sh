script() {
    [ -f twingle ] && echo "$(wc -l <twingle) twingle" || (createTwingle >/dev/null 2>&1 && echo "$(wc -l <twingle) twingle")
}
