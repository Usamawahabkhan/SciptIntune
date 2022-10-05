Install-Module -Name 'AzureAD'
Install-Module -Name 'MSOnline'
Install-Module -Name 'Az' -AllowClobber -Scope 'CurrentUser'
Install-Module -Name 'Microsoft.Online.SharePoint.PowerShell'
Install-Module -Name 'SharePointPnPPowerShellOnline'



#Install MSAL.PS module for all users (requires admin rights)
Install-Module MSAL.PS -Scope AllUsers -Force
 
#Generate Access Token to use in the connection string to MSGraph
$AppId = '90cb4cab-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
$TenantId = '95cb1f18-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
$ClientSecret = 'app registration secret'
 
Import-Module MSAL.PS
$MsalToken = Get-MsalToken -TenantId $TenantId -ClientId $AppId -ClientSecret ($ClientSecret | ConvertTo-SecureString -AsPlainText -Force)
 
#Connect to Graph using access token
Connect-Graph -AccessToken $MsalToken.AccessToken

Find-MgGraphPermission user -PermissionType Delegated

