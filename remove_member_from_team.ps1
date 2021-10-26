$pat= "token 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"
$org_name="Test-Github007123"
$name=""
$team="devops"

$uri="https://api.github.com/orgs/$org_name/members"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $pat
}

$members =Invoke-RestMethod -Uri $uri -Method Get -Headers $headers 

$member_names=[array]$members.login 
Write-Output $member_names


$uri2="https://api.github.com/teams/$team/members/$name"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $pat
}

Invoke-RestMethod -Uri $uri2 -Method Delete -Headers $headers 
