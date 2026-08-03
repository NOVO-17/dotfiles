oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\darkblood.omp.json" | Invoke-Expression

[Environment]::SetEnvironmentVariable(
    "WEZTERM_CONFIG_FILE",
    "E:\dotfiles\wezterm\.wezterm.lua",
    "User"
)

[Environment]::SetEnvironmentVariable(
    "XDG_CONFIG_HOME",
    "E:\dotfiles",
    "User"
)
function edit{
  nvim "E:\dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
}

function dotfiles{
cd "E:\dotfiles"
}

function gs{
git status
}
