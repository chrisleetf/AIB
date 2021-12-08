# Software install Script
#
# Applications to install:

#region Set logging 
$logFile = "c:\temp\" + (get-date -format 'yyyyMMdd') + '_softwareinstall.log'
function Write-Log {
    Param($message)
    Write-Output "$(get-date -format 'yyyyMMdd HH:mm:ss') $message" | Out-File -Encoding utf8 $logFile -Append
}
#endregion

#region Adobe Reader Installation
try {
    Start-Process -FilePath "c:\temp\software\AcroRdrDC2100720099_en_US.exe" -ArgumentList "/sPB /rs" -NoNewWindow -Wait
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

#region Net Framework 3.5 Enable
try {
    Start-Process -FilePath "C:\temp\Software\Net Framework 3.5 Enable Script.bat" -NoNewWindow -Wait
    if (Test-Path "C:\Windows\Microsoft.NET\Framework64\v3.5\Microsoft.Build.Tasks.v3.5.dll") {
        Write-Log ".Net Framework 3.5 has been installed"   
        }
    else {
        write-log "Error locating the .Net Framework 3.5 executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
#endregion


#region Oracle Client
try {
    Start-Process -FilePath "C:\temp\Software\OracleClientInstallation.bat" -NoNewWindow -Wait
    if (Test-Path "C:\app\product\11.2.0\client_1\network\admin\sqlnet.ora") {
        Write-Log "Oracle Client has been installed"   
        }
    else {
        write-log "Error locating the Oracle Client executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
#endregion

#region Oracle ODAC
try {
    Start-Process -FilePath "C:\temp\Software\OracleODACInstallation.bat" -NoNewWindow -Wait
    if (Test-Path "C:\app\product\11.2.0\odac\heteroxa11.dll") {
        Write-Log "Oracle ODAC has been installed"   
        }
    else {
        write-log "Error locating the Oracle ODAC executable"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
#endregion

#region tnsnames Copy
try {
    Start-Process -FilePath "C:\temp\Software\Robocopy tnsnames.bat" -NoNewWindow -Wait
    if (Test-Path "C:\app\product\11.2.0\odac\Network\Admin\tnsnames.ora") {
        Write-Log "tnsnames file has been copied"   
        }
    else {
        write-log "Error copying tnsnames file"
    }
}
catch {
    $ErrorMessage = $_.Exception.message
    write-log "Error installing Adobe Reader: $ErrorMessage"
}
#endregion
