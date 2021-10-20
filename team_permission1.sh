  curl \
  -H "Authorization: token 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 " \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
   https://api.github.com/orgs/Test-Github007123/teams/devops/repos/Test-Github007123/ABC123 \
  -d '{"permission":"triage"}'