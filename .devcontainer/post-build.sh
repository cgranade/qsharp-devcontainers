#!/bin/bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 2.2.401
# Add the appropriate paths to $PATH through the bash profile.
cat << \EOF >> ~/.bash_profile
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools/:$HOME/.local/bin:$PATH"
EOF
# Apply the bash profile now, to make sure we override any existing .NET Core installations.
source ~/.bash_profile
# Install Python requirements.
pip3 install --user notebook qsharp
# Install required .NET Global Tools.
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet tool install -g PowerShell
# Configure IQ# for use with Jupyter and qsharp.py.
dotnet iqsharp install --user
# Install required PowerShell modules for demos.
# Note that the global tool version of pwsh uses different args.
pwsh "Install-Module -Force posh-tex"
