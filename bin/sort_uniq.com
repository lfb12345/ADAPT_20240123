
OPTION=$1

if [ $OPTION ]; then

   sort $OPTION | uniq -c | sed 's/^\ \ *//' | sed 's/\ /	/'

else

   sort | uniq -c | sed 's/^\ \ *//' | sed 's/\ /	/'

fi

