!/bin/bash
#
# Adds a github user to all private repositories of another user
#

SCRIPTNAME=`basename $0`
GITHUB_SOURCE_USER="joshua781467"
GITHUB_TARGET_USER="vijishankar"
GITHUB_SOURCE_PWD="Yamini0071@"

usage () {
  echo "A script to add a new collaborator to all repositories of a given github user"
  echo
  echo "Usage:"
  echo "------"
  echo "./$SCRIPTNAME -s github-username-of-repos-admin -p github-repos-admin-pwd -c github-username-of-collaborator"
  echo 
  echo "All parameters mandatory"
  echo "text"
  echo "local text"
  exit
}

work_ass_off () {
  # Check login
  echo "Checking credentials..."
  credentials_ok=`curl -s -u "$GITHUB_SOURCE_USER:$GITHUB_SOURCE_PWD" https://api.github.com | grep -c -s "message"`
  if [ "$credentials_ok" == "0" ]; then
    echo "Credentials OK"
    echo "Fetching repos..."
    repos=`curl -d "type=private" -d "per_page=100" -s -u "$GITHUB_SOURCE_USER:$GITHUB_SOURCE_PWD" https://api.github.com/users/$GITHUB_SOURCE_USER/repos | grep -s "name" | sed "s/ //g"`
    for repo_string in $repos ; do
      repo=`echo $repo_string | cut -d '"' -f 4`
      echo "Repro '$repo' -> adding collaborator '$GITHUB_TARGET_USER'"
      curl -d "ignore=1" -X PUT -s -u "$GITHUB_SOURCE_USER:$GITHUB_SOURCE_PWD" https://api.github.com/repos/$GITHUB_SOURCE_USER/$repo/collaborators/$GITHUB_TARGET_USER
    done
  else
    echo "Could not authenticate with github.com api. Check credentials given."
    exit
  fi

}

# Must have three arguments
if [ ! $# == 6 ]; then
  usage
  exit
fi

while getopts "s:c:p:" option
do
  case $option in
  s)  GITHUB_SOURCE_USER=$OPTARG 
      ;;
  c)  GITHUB_TARGET_USER=$OPTARG 
      ;;
  p)  GITHUB_SOURCE_PWD=$OPTARG 
      ;;
  *)  usage
      exit
      ;;
  \?) usage
      exit
      ;;
  esac
done


if [[ -n "$GITHUB_SOURCE_USER" && -n "$GITHUB_TARGET_USER" && -n "$GITHUB_SOURCE_PWD" ]]; then
  work_ass_off
else
  usage
fi
