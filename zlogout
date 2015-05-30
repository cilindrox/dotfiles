# Invalidate sudo session
sudo -k ;

#if [ "$(tty)" = "/dev/console" ] ; then
if [ "$(tty)" = "/dev/tty1" ] ; then
#    rm $HOME/.serverauth.*
    mpd --kill
fi

# Clear and reset the screen (only if it's at the physical console.)
# so next person can't see anything from the session.
if [ ! $DISPLAY ]; then
    if [ ! $SSH_CLIENT ]; then
        [[ -x $(which clear) ]] && =clear
#        [[ -x $(which reset) ]] && =reset
    fi
fi

# Only for a normal user in the console, make the cow say a fortune *g*
#FORTUNE="/usr/games/fortune"
#FORTUNE_OPTS="-s"
#COWSAY="/usr/pkg/bin/cowsay"
#if [ "$UID" != 0 ] && [ ! "${DISPLAY}" ]; then
#    if [ -x ${COWSAY} ]; then
#        if [ -x ${FORTUNE} ]; then
#            ${FORTUNE} ${FORTUNE_OPTS} | ${COWSAY} -nW80; echo
#        fi
#    elif [ -x ${FORTUNE} ]; then
#        ${FORTUNE} ${FORTUNE_OPTS}; echo
#    fi
#fi
