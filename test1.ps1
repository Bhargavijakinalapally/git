
$uri="https://api.github.com/orgs/Test-Github007123/teams/developers/repos/Test-Github007123/ABC123"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = 'token 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'
}

$body = @{
 "permission"="triage"
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -Body $body
