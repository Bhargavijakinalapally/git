PersonalAccessToken="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"

curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $PersonalAccessToken"
  https://api.github.com/orgs/Test-Github007123/teams/devops/repos/Test-Github007123/ABC123 \
  -d '{"permission":"admin"}'
