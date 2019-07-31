#!/bin/bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 2.2.401
# Add the appropriate paths to $PATH through the bash profile.
cat << \EOF >> ~/.bash_profile
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools/:$PATH"
EOF
# Apply the bash profile now, to make sure we override any existing .NET Core installations.
source ~/.bash_profile
# Install required .NET Global Tools.
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet tool install -g PowerShell
# Install required PowerShell modules for demos.
pwsh -Command "Install-Module -Force posh-tex"
