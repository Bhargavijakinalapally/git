declare -a email=("joelnathanial777@gmail.com" "joshuabarnesedward@gmail.com")
org_name=Test-Github007123
team_name=Devops
GITHUB_OAUTH_TOKEN="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"
for i in "${email[@]}"                                                    \
do                                                                        \
team_id="$(
    curl -s                                                               \
         -H "Authorization: token $GITHUB_OAUTH_TOKEN"                    \
         "https://api.github.com/orgs/$org_name/teams"                   |\
      jq 'map(select(.name=="'$team_name'")) | .[].id'
)"

json='{
  "role": "direct_member",
  "team_ids":['$team_id'],
  "email":"'$i'"
}'

echo "$i"

curl -s                                                                   \
     -H "Authorization: token $GITHUB_OAUTH_TOKEN"                        \
     -H "Accept: application/vnd.github.dazzler-preview+json"             \
     -d "$json"                                                           \
     "https://api.github.com/orgs/$org_name/invitations"
done
