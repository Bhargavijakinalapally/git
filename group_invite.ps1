$strarry = @("joshuabarnesedward@gmail.com", "joewick07@gmail.com","jkmramachandran@gmail.com")
$org_name="Test-Github007123"
$team="developers"
$pat="token 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"
foreach ($email in $strarry) {

$uri="https://api.github.com/orgs/$org_name/teams/$team"
$headers = @{

    'Authorization' = 'token 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'
}
$team_full=Invoke-RestMethod -Uri $uri -Method Get -Headers $headers 

 $team_id= [array]$team_full.id

$body = @{
    "role"="direct_member"
    "team_ids"=$team_id
    "email"=$email
} | ConvertTo-Json



$uri2="https://api.github.com/orgs/$org_name/invitations"

$header2=@{
    'Authorization' = 'token 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'
    'Accept' = 'application/vnd.github.dazzler-preview+json'
}

Invoke-RestMethod -Uri $uri2 -Method Post -Headers $header2 -Body $body

}
