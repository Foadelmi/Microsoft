$complist = Get-Content "e:\list-of-ip.txt"
foreach($comp in $complist){
$TimeToLive = Test-Connection $comp -Count 1 -ErrorAction SilentlyContinue | select -exp ResponseTimeToLive
Switch($TimeToLive){
{($_ -ge 120) -and ($_ -le 129)} {$comp + " is Windows and needs installation of Symantec       "+$TimeToLive; break}
}
}
pause
