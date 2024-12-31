swww query > /dev/null
if [ $? -eq 0 ] ; then
    swww kill
fi
nohup swww-daemon &> /dev/null &disown
