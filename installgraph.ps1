$PSVersionTable.PSVersion
Install-Module PowerShellGet -Force

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser



# installing graph
Install-Module Microsoft.Graph -Scope AllUsers -Force


 Import-Module Microsoft.Graph

 Find-MgGraphPermission user -PermissionType Delegated
# api call scope
 Connect-MsGraph -Scopes `
 "User.Read", `
 "User.ReadWrite.All", `
 "Mail.ReadWrite", `
 "Directory.Read.All", `
 "Chat.ReadWrite", `
 "People.Read", `
 "Group.Read.All", `
 "Tasks.ReadWrite", `
 "Sites.Manage.All"

#  How To Get The Scopes From The Current Session
 Get-MgContext c