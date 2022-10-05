#Install MSAL.PS module for all users (requires admin rights)
Install-Module MSAL.PS -Scope AllUsers -Force
 
#Generate Access Token to use in the connection string to MSGraph
$AppId = 'e8cb9901-168d-40bd-a9e2-26e1062a620c'
$TenantId = '301e0b4f-a72b-4165-a765-c9f57774ae88'
$ClientSecret = 'Qvb8Q~P6Mkhogn~aUmHDPe5kEXKvUy6MNGHuwces'
 
Import-Module MSAL.PS
$MsalToken = Get-MsalToken -TenantId $TenantId -ClientId $AppId -ClientSecret ($ClientSecret | ConvertTo-SecureString -AsPlainText -Force)
 
#Connect to Graph using access token
Connect-MgGraph   -AccessToken $MsalToken.AccessToken

