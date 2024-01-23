
DATE=`date "+%Y%m%d"`

DIRECTORY=/Users/astropooch/Space/PROGRAMS/HARVEST/CDAWEB/VXO/$DATE

DASHES='+'$(printf "%0.s-" $(seq 1 273))'+'

if [ ! -e $DIRECTORY ]; then

   mkdir $DIRECTORY

   cd $DIRECTORY

   curl -sS https://github.com/orgs/hpde/repositories &> hpde_git_clone_$DATE.html

   REPOSITORY_LIST=`grep '\ href="/hpde/' hpde_git_clone_20211020.html | grep -v /issues | grep -v /network/members | grep -v /pulls | grep -v /stargazers | sed 's/^.*\ href="\/hpde\///' | sed 's/"\ .*$//' | sort | uniq`

   for REPOSITORY in $REPOSITORY_LIST

   do

       printf "%s\n\nHPDE Reegistry:  %s\n\n" $DASHES $REPOSITORY >> hpde_git_clone_$DATE.txt

       git clone -b master --single-branch --depth=1 https://github.com/hpde/$REPOSITORY &> hpde_git_clone_$DATE'_temp.txt'

       cat hpde_git_clone_$DATE'_temp.txt' >> hpde_git_clone_$DATE.txt

       rm hpde_git_clone_$DATE'_temp.txt'

       printf "\n%s\n" $DASHES >> hpde_git_clone_$DATE.txt

   done

fi

sed 's//	/g' hpde_git_clone_$DATE.txt &> hpde_git_clone_$DATE'_temp.txt'

mv hpde_git_clone_$DATE'_temp.txt' hpde_git_clone_$DATE.txt

