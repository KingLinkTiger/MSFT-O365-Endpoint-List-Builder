<#

Script Name: O365 Endpoint List Builder
Description: This script utilized MSFT's WebSocket service in order to build ArrayLists of URLs and IPs that need to be configured for O365 access.

#>

#Valid Values= Worldwide | China | Germany | USGovDoD | USGovGCCHigh
$instance = "USGovGCCHigh"

$json = Invoke-WebRequest -Uri "https://endpoints.office.com/endpoints/$($instance)?format=JSON&clientrequestid=$((New-GUID).GUID)"
$json = ConvertFrom-Json $json.Content

$urls = [System.Collections.ArrayList]@()
$ips = [System.Collections.ArrayList]@()

foreach($id in $json){

    
    foreach($url in $id.urls){
        [void]$urls.Add($url)
    }

    foreach($ip in $id.ips){
        [void]$ips.Add($ip)
    }

}