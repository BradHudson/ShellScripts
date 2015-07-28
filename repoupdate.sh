for REPO in `ls`; do
if [ ${REPO: -3} == ".sh" ]; then
echo 'This is a shell script.'
else
   (cd "$REPO";
    if git rev-parse --is-inside-git-dir  > /dev/null 2>&1; then
        if [[ $(git pull | grep 'Already up-to-date.') ]]; then
            echo "Already up to date my man!"
        else bundle && powder down && powder up;
        fi
    else
	echo 'Not a git Repo.'
    fi) 
fi 
done;




