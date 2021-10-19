
email="joelnathanial777@gmail.com"
org_name=Test-Github007123
team_name=Devops
GITHUB_OAUTH_TOKEN="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"


team_id="$(
    curl -s                                                               \
         -H "Authorization: token $GITHUB_OAUTH_TOKEN"                    \
         "https://api.github.com/orgs/$org_name/teams"                   |\
      jq 'map(select(.name=="'$team_name'")) | .[].id'
)"
json='{
  "role": "direct_member",
  "team_ids":['$team_id'],
  "email":"'$email'"
}'


curl -s                                                                   \
     -H "Authorization: token $GITHUB_OAUTH_TOKEN"                        \
     -H "Accept: application/vnd.github.dazzler-preview+json"             \
     -d "$json"                                                           \
     "https://api.github.com/orgs/$org_name/invitations"