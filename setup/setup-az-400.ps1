# Install Chcolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Software
choco install microsoft-edge -y
choco install googlechrome -y
choco install vscode -y
choco install git -y
choco install gitextensions -y
choco install git-lfs.install -y
choco install gitversion.portable -y
choco install dotnetcore-sdk -y
choco install dotnet-6.0-sdk -y
choco install nodejs --version=16.10.0 -y
choco install azure-cli -y
choco install azure-functions-core-tools-4 --params="'/x64:true'" -y
choco install gh -y
choco install curl -y

# Refresh Path Env for npm 
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Set NuGet Source
dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org

# Intall VS Code Extensions
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension GitHub.vscode-pull-request-github
code --install-extension redhat.vscode-yaml
code --install-extension bencoleman.armview
code --install-extension mdickin.markdown-shortcuts
code --install-extension mhutchie.git-graph 
code --install-extension ms-azure-devops.azure-pipelines		
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension vs-publisher-1448185.keyoti-changeallendoflinesequence
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-azuretools.vscode-azurecontainerapps

# Azurite Storage Emulator
npm install -g azurite

# Install Angular
npm i -g @angular/cli

# Http-Server
npm i -g http-server

# Finished Msg
Write-Host "Finished Software installation" -ForegroundColor yellow
