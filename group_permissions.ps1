$org_name= "Test-Github007123"
$repo="ABC123"
$team="developers"
$pat="token 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"
$uri="https://api.github.com/orgs/$org_name/teams/$team/repos/$org_name/$repo"
$permission="pull"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $pat
}

$body = @{
'permission' = $permission
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method PUT -Headers $headers -Body $body
