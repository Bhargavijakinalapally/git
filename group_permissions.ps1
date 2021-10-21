$org_name= "Test-Github007123"
$repo="ABC123"
$team="developers"

$uri="https://api.github.com/orgs/$org_name/teams/$team/repos/$org_name/$repo"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = 'token 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'
}

$body = @{
'permission' = 'triage'
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method PUT -Headers $headers -Body $body