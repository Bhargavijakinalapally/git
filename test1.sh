 curl \
  -H "Authorization: token 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" \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
   https://api.github.com/orgs/Test-Github007123/teams/devops/repos/Test-Github007123/ABC123 \
  -d '{"permission":"triage"}'
