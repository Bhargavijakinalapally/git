YourUserName="joshua781467"
PersonalAccessToken="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"
team_name="Devops"
org_name="Test-Github007123"
repo="ABC123"


team_id="$(
    curl -s                                                               \
         -H "Authorization: token $PersonalAccessToken"                    \
         "https://api.github.com/orgs/$org_name/teams"                   |\
      jq 'map(select(.name=="'$team_name'")) | .[].id'
)"

curl -H "Accept: application/vnd.github.v3+json" -u $UserName:Yamini0071@ -X PUT -d '{"permission":"admin"}' https://api.github.com/teams/$team_id/repos/$org_name/$repo
