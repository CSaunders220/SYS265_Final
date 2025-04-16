$rootPath = "C:\DFSShares"
New-Item -Path $rootPath -ItemType Directory -Force
New-Item -Path "$rootPath\Profiles" -ItemType Directory -Force
New-Item -Path "$rootPath\Profiles\UserProfiles" -ItemType Directory -Force
New-Item -Path "$rootPath\Profiles\RedirectedFolders" -ItemType Directory -Force

New-SmbShare -Name "Profiles" -Path "$rootPath\Profiles" -FullAccess "Domain Admins","SYSTEM" -ChangeAccess "Authenticated Users"

# For the main Profiles folder
$acl = Get-Acl "$rootPath\Profiles"
$acl.SetAccessRuleProtection($true, $false)

# Add Domain Admins with Full Control
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Domain Admins", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)

# Add SYSTEM with Full Control
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("SYSTEM", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)

# Add Authenticated Users with Modify rights
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Authenticated Users", "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)

# Apply the ACL
Set-Acl "$rootPath\Profiles" $acl

# Apply similar permissions to subfolders
Copy-Item -Path "$rootPath\Profiles" -Destination "$rootPath\Profiles\UserProfiles" -ItemType Directory
Copy-Item -Path "$rootPath\Profiles" -Destination "$rootPath\Profiles\RedirectedFolders" -ItemType Directory
