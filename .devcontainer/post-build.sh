#!/bin/bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 2.2.401
# Add the appropriate paths to $PATH through the bash profile.
CAT << \EOF >> ~/.bash_profile
export PATH="$HOME/.dotnet:$HOME/.dotnet/tools/:$PATH"
EOF
# Install required .NET Global Tools.
dotnet install -g Microsoft.Quantum.IQSharp
dotnet install -g PowerShell
