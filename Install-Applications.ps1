# Software install Script
#
# Applications to install:
#
# Foxit Reader Enterprise Packaging (requires registration)
# https://kb.foxitsoftware.com/hc/en-us/articles/360040658811-Where-to-download-Foxit-Reader-with-Enterprise-Packaging-MSI-
# 
# Notepad++
# https://notepad-plus-plus.org/downloads/v7.8.8/
# See comments on creating a custom setting to disable auto update message
# https://community.notepad-plus-plus.org/post/38160



#region Set logging 
$logFile = "c:\temp\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#region Adobe Reader Installation
try {
    Start-Process -FilePath "c:\temp\software\AcroRdrDC2100720099_en_US.exe" -ArgumentList "/sPB /rs"
    if (Test-Path "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe") {
        Write-Log "Adobe Reader has been installed"
    }
    else {
        write-log "Error locating the Adobe Reader executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
#endregion

#region Notepad++
Powershell.exe -File "C:\temp\Software\InstallWindowUpdateScript.ps1"
#endregion
