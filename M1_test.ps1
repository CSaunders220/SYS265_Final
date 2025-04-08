Test-Connection -Count 1 champlain.edu | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 fw-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 dc1-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 dc2-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 w1-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 w2-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
Test-Connection -Count 1 mgmt1-caw.caw.local | Select-Object @{Name="Target";Expression={$_.Address}}, @{Name="Latency (ms)";Expression={$_.ResponseTime}}, @{Name="Status";Expression={$_.StatusCode}}
