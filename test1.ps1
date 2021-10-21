
$uri="https://api.github.com/orgs/Test-Github007123/teams/developers/repos/Test-Github007123/ABC123"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = 'token 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'
}

$body = @{
 "permission"="triage"
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method Put -Headers $headers -Body $body
