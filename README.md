env-config-scripts
=========================

A set of PowerShell scripts to backup and restore environment settings (configuration files, registry).
 

Usage
------
After installing, excecute the following powershell commands:

- Env-Conf-Backup
- Env-Conf-Restore


Installing
------------

0. Verify you have PowerShell 2.0 or better with $PSVersionTable.PSVersion

1. Verify execution of scripts is allowed with `Get-ExecutionPolicy` (should be `RemoteSigned` or `Unrestricted`). If scripts are not enabled, run PowerShell as Administrator and call `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm`.

2. Clone the env-config-scripts repository to your local machine.

3. From the env-config-scripts repository directory, run `.\install.ps1`


Configuration
-------------

1. create/modify profile `env-conf_profile.ps1` at powershell `$profile\env-conf` folder
eg: 

- Windows 8.1 `C:\Users\<username>\Documents\WindowsPowerShell\env-conf\env-conf_profile.ps1`

2. Add/replace the variable `$env_conf_backupPath` with your preferred backup place
eg:

- `$env_conf_backupPath = "C:\Users\<username>\Repos\Environment.Settings\"`
- `$env_conf_backupPath = "C:\Users\<username>\Skydrive\Environment.Settings\"`

3. add custom (global/user) `modules` to your setup. In your env-config-scripts repository on your local machine you'll find a folder `sample-modules`. Copy needed 'modules' to the folder `C:\Users\<username>\Documents\WindowsPowerShell\env-conf\env-conf\modules\`, or create your own 'module' extensions and send a pull request.


Included sample 'modules'
----------------

- powershell
- git
- mercurial
- nuget
- conemu
- jslint
- visualstudio


Contributions
=============

Feel free to send a pull request for additional configurations

### Based on work by:

 - posh-git, https://github.com/dahlbyk/posh-git