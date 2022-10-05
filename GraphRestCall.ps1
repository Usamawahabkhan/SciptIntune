$ApplicationID = ""
$TenatDomainName = ""
$AccessSecret = Read-Host "Enter Secret"


$Body = @{    
Grant_Type    = "client_credentials"
Scope         = "https://graph.microsoft.com/.default"
client_Id     = $ApplicationID
Client_Secret = $AccessSecret
} 

$ConnectGraph = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$TenatDomainName/oauth2/v2.0/token" `
-Method POST -Body $Body

$token = $ConnectGraph.access_token


$GrapGroupUrl = 'https://graph.microsoft.com/v1.0/Groups/'
(Invoke-RestMethod -Headers @{Authorization = "Bearer $($token)"} -Uri $GrapGroupUrl -Method Get).value.displayName

