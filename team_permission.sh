orgName=Test-Github007123
team=devops
owner=Test-Github007123
repo=ABC123
PAT="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"
permission="admin"

json='{
  "permission":"'$permission'"
}'

curl -s                                                                              \
     -H "Authorization: token $PAT "                                                 \
     -X PUT                                                                          \
     -H "Accept: application/vnd.github.v3+json"                                     \
     "https://api.github.com/orgs/$orgName/teams/$team/repos/$owner/$repo"          |\
     -d "$json"
