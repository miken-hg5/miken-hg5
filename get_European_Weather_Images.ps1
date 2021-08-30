#
# Download PNG/JPEG image of the weather maps, saves access to 3rd party system 
# 3rd party does not support HTTPS/SSL
#

$url1 = "http://www.worldagweather.com/nogger/pastpcp_eu_30day.png"
$url2 = "http://www.worldagweather.com/nogger/pastpcp_anom_eu_30day.png"
$url3 = "http://www.worldagweather.com/fcstwx/fcstpcp_anom_gfs_eu.png"

$location = Get-Location 
write-host "Current location is" $location
try
{
    $fileLocation1 = $location.Path + "\past_30_days.png"
    & "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --headless --disable-gpu --window-size=540,540 --screenshot=$fileLocation1 $url1
    Start-Sleep -Seconds 5

    $fileLocation2 = $location.Path + "\analysis_30_days.png"
    & "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --headless --disable-gpu --window-size=540,540 --screenshot=$fileLocation2 $url2
    Start-Sleep -Seconds 5

    $fileLocation3 = $location.Path + "\forecast_ahead_days.png"
    & "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --headless --disable-gpu --window-size=540,540 --screenshot=$fileLocation3 $url3
    Start-Sleep -Seconds 5
    Exit 0
}
catch
{
  Write-Host "An error occurred:"
  Write-Host $_.ScriptStackTrace
  Exit 1
}
