param (
    [Parameter(Mandatory = $true)]
    [String]
    $org_name,

    [Parameter(Mandatory = $true)]
    [String]
    $repo,

    [Parameter(Mandatory = $true)]
    [String]
    $team,
  
    [Parameter(Mandatory = $true)]
    [String]
    $patToken,
  
    [Parameter(Mandatory = $true)]
    [String]
    $uri = "https://api.github.com/orgs/$org_name/teams/$team/repos/$org_name/$repo",
  
    [Parameter(Mandatory = $true)]
    [String]
    $permission
  )






$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $patToken
}

$body = @{
'permission' = $permission
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method PUT -Headers $headers -Body $body
