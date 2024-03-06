# Folder and File Name Variables
$JavaConfigFolderPath = "$Env:windir\Sun\Java\Deployment"
$JavaCOnfigPath = "$JavaConfigFolderPath\deployment.config"
$DeploymentPropertiesPath = "$JavaConfigFolderPath\deployment.properties"

# Contents of deployment.config
$JavaCOnfigContents = "# Hardened Mandatory Configuration
deployment.system.config=C\:\\Windows\\Sun\\\Java\\Deployment\\deployment.properties
deployment.system.config.mandatory=true"

# Contents of deployment.properties
$DeploymentPropertiesContents = "deployment.webjava.enabled=false
deployment.webjava.enabled.locked"

# Check if the folder exists, if it doesn't - create it
if (Test-Path $JavaConfigFolderPath) {
    Write-host "Folder Already Exists..."
} else {
    New-Item -ItemType Directory -Force -Path $JavaConfigFolderPath
}

# Create the deployment.config and deployment.properties files
$JavaCOnfigContents | Out-File -Force -NoNewLine -FilePath $JavaCOnfigPath
$DeploymentPropertiesContents  | Out-File -Force -NoNewLine -FilePath $DeploymentPropertiesPath