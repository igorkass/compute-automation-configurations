# Invoke data disk preparation
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; &([scriptblock]::Create((Invoke-WebRequest -useb 'https://raw.githubusercontent.com/igorkass/compute-automation-configurations/master/prepare_data_disk.ps1')))"
# Invoke dotnet installation
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; &([scriptblock]::Create((Invoke-WebRequest -useb 'https://dot.net/v1/dotnet-install.ps1'))) -Channel Current -Runtime dotnet -InstallDir C:\\Packages\\dotnet"
# Add dotnet installation directory to PATH
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\Packages\dotnet", "Machine")