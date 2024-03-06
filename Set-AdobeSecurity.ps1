Function New-AdobeRegistryPath {
    param (
        [Parameter(Mandatory = $true)]
        [string]$registryPath
    )

    If(!(Test-Path $registryPath)) {
      New-Item -Path $registryPath -Force
    }
}

Function New-AdobeRegistryValue {
    param (
        [Parameter(Mandatory = $true)]
        [string]$RegistryPath,
        [Parameter(Mandatory = $true)]
        [string]$RegistryKey,
        [Parameter(Mandatory = $true)]
        [string]$RegistryValue
    )

    New-ItemProperty -Path $RegistryPath -Name $RegistryKey -Value $RegistryValue -PropertyType Dword -Force
}

$AdobeReader = "HKLM:\Software\Policies\Adobe\Acrobat Reader\DC\FeatureLockDown"
$AdobeDC = "HKLM:\Software\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown"

$AdobeReaderWebmail = "$AdobeReader\cWebmailProfiles"
$AdobeDCWebmail = "$AdobeDC\cWebmailProfiles"

# Create the Registry Paths
New-AdobeRegistryPath $AdobeReader
New-AdobeRegistryPath $AdobeDC

# Force enables Protected Mode
New-AdobeRegistryValue $AdobeReader "bProtectedMode" "1"
New-AdobeRegistryValue $AdobeDC "bProtectedMode" "1"

# Forces enhanced security for the standalone application.
New-AdobeRegistryValue $AdobeReader "bEnhancedSecurityStandalone" "1"
New-AdobeRegistryValue $AdobeDC "bEnhancedSecurityStandalone" "1"

# Forces enhanced security when the application is running in the browser.
New-AdobeRegistryValue $AdobeReader "bEnhancedSecurityInBrowser" "1"
New-AdobeRegistryValue $AdobeDC "bEnhancedSecurityInBrowser" "1"

# Forces protected view in the Outlook Attachment viewer
New-AdobeRegistryValue $AdobeReader "bEnableAlwaysOutlookAttachmentProtectedView" "0"
New-AdobeRegistryValue $AdobeDC "bEnableAlwaysOutlookAttachmentProtectedView" "0"

# Force protected view for all files
New-AdobeRegistryValue $AdobeReader "iProtectedView" "2"
New-AdobeRegistryValue $AdobeDC "iProtectedView" "2"

# Enables AppContainer sandbox
New-AdobeRegistryValue $AdobeReader "bEnableProtectedModeAppContainer" "1"
New-AdobeRegistryValue $AdobeDC "bEnableProtectedModeAppContainer" "1"

# Force disables Flash content in PDFs
New-AdobeRegistryValue $AdobeReader "bEnableFlash" "0"
New-AdobeRegistryValue $AdobeDC "bEnableFlash" "0"

# Disables 3D objects
New-AdobeRegistryValue $AdobeReader "bEnable3D" "0"
New-AdobeRegistryValue $AdobeDC "bEnable3D" "0"

# Hides the automatic update notifications (Does not stop updates though)
New-AdobeRegistryValue $AdobeReader "bUpdater" "0"
New-AdobeRegistryValue $AdobeDC "bUpdater" "0"

# Blocks the Webmail functions
New-AdobeRegistryValue $AdobeReaderWebmail "cWebmailProfiles" "1"
New-AdobeRegistryValue $AdobeDCWebmail "cWebmailProfiles" "1"

# Does not allow users to add trusted locations
New-AdobeRegistryValue $AdobeReader "bDisableTrustedSites" "1"
New-AdobeRegistryValue $AdobeDC "bDisableTrustedSites" "1"

# Prevents users from opening attachments in PDFs
New-AdobeRegistryValue $AdobeReader "iFileAttachmentPerms" "1"
New-AdobeRegistryValue $AdobeDC "iFileAttachmentPerms" "1"

# Removes all upsell features of Reader
New-AdobeRegistryValue $AdobeReader "bAcroSuppressUpsell" "1"