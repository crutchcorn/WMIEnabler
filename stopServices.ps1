$Dependencies = Get-Service -Name winmgmt -DependentServices |Where-Object {$_.Status -eq 'Running'}

foreach ($Service in $Dependencies){
    $Service.Stop()
}