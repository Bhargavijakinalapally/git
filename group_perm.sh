  pat="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"
  org_name=Test-Github007123
  team_name=developers
  owner=Test-Github007123
  repo=ABC123
  perm="admin"

  
  curl \
  -H "Authorization: token $pat" \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
   https://api.github.com/orgs/$org_name/teams/$team_name/repos/$owner/$repo \
  -d '{"permission":"'$perm'"}'
