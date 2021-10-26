$pat= "token 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"
$org_name="Test-Github007123"
$name="pradeep720"
$team="developers"

$uri="https://api.github.com/orgs/$org_name/members"


$headers = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $pat
}

$members =Invoke-RestMethod -Uri $uri -Method Get -Headers $headers 

$member_names=[array]$members.login 
Write-Output $member_names

$uri2="https://api.github.com/orgs/$org_name/teams/$team"
$headers1 = @{

    'Authorization' = $pat
}
$team_full=Invoke-RestMethod -Uri $uri2 -Method Get -Headers $headers1 

 $team_id= [array]$team_full.id


$uri3="https://api.github.com/teams/$team_id/members/$name"


$headers2 = @{
    'Accept' = 'application/vnd.github.v3+json'
    'Authorization' = $pat
}

Invoke-RestMethod -Uri $uri3 -Method Delete -Headers $headers2 
