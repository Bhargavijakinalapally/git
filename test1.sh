 curl \
  -H "Authorization: token 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" \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
   https://api.github.com/orgs/Test-Github007123/teams/devops/repos/Test-Github007123/ABC123 \
  -d '{"permission":"triage"}'
