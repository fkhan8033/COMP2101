Get-CimInstance -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true | Format-Table -Property ServiceName,index,IPaddress,description,DNSDomain -Autosize