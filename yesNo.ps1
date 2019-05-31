Clear-Host

[bool]$stopExecution = $false

do {
    $reply = Read-Host "Do you want to stop? yes/no"

    if ( $reply.ToUpper() -eq "YES" )
    {
        Write-Host "You said STOP; closing in 5-seconds."
        $stopExecution = $true
        Start-Sleep -Seconds 5
        exit
    }
    else
    {
        Write-Host "You entered no."  
    }

    Write-Host "Repeat loop..."
} while ( $stopExecution -eq $false)