<p align="center">
  <img src="https://github.com/bitwarden/brand/blob/master/screenshots/apps-combo-logo.png" alt="Bitwarden" />
</p>
<p align="center">
  <a href="https://ci.appveyor.com/project/open-bitwarden/server/branch/master" target="_blank">
    <img src="https://ci.appveyor.com/api/projects/status/5la21itpjfg9my89/branch/master?svg=true" alt="appveyor build" />
  </a>
  <a href="https://hub.docker.com/u/openbitwarden/" target="_blank">
    <img src="https://img.shields.io/docker/pulls/open-bitwarden/api.svg" alt="DockerHub" />
  </a>
  <a href="https://gitter.im/open-bitwarden/Lobby" target="_blank">
    <img src="https://badges.gitter.im/open-bitwarden/Lobby.svg" alt="gitter chat" />
  </a>
</p>

-------------------

Open Bitwarden is a project dedicated to make Bitwarden true Open Source and Free software.
Without arbitrairy licence restrictions that have no legal backing due to the AGPL licence.

By creating a custom project, we are able to utilise the same deployment process as Bitwarden uses.
This way anyone (even without thorough development knowhow) should be able to run this without licences.

While doing this we try and limit the scope of any changes made, to guarantee code quality and compatibility.
Any fixed found/made will be send upstream and issues (outside of licencing) should also be send there.

-------------------

The Bitwarden Server project contains the APIs, database, and other core infrastructure items needed for the "backend" of all bitwarden client applications.

The server project is written in C# using .NET Core with ASP.NET Core. The database is written in T-SQL/SQL Server. The codebase can be developed, built, run, and deployed cross-platform on Windows, macOS, and Linux distributions.



## Development Build/Run

### Requirements

- [.NET Core 2.x SDK](https://www.microsoft.com/net/download/core)
- [SQL Server 2017](https://docs.microsoft.com/en-us/sql/index)
- 2GB+ RAM

*These dependencies are free to use.*

### Recommended Development Tooling

- [Visual Studio](https://www.visualstudio.com/vs/) (Windows and macOS)
- [Visual Studio Code](https://code.visualstudio.com/) (other)

*These tools are free to use.*

### API

```
cd src/Api
dotnet restore
dotnet build
dotnet run
```

visit http://localhost:5000/alive

### Identity

```
cd src/Identity
dotnet restore
dotnet build
dotnet run
```

visit http://localhost:33657/.well-known/openid-configuration

## Deploy

<p align="center">
  <a href="https://hub.docker.com/u/bitwarden/" target="_blank">
    <img src="https://i.imgur.com/SZc8JnH.png" alt="docker" />
  </a>
</p>

You can deploy Bitwarden using Docker containers on Windows, macOS, and Linux distributions. Use the provided PowerShell and Bash scripts to get started quickly. Find all of the Bitwarden images on [Docker Hub](https://hub.docker.com/u/bitwarden/).

Full documentation for deploying Bitwarden with Docker can be found in our help center at: https://help.bitwarden.com/article/install-on-premise/

### Requirements

- [Docker](https://www.docker.com/community-edition#/download)
- [Docker Compose](https://docs.docker.com/compose/install/) (already included with some Docker installations)

*These dependencies are free to use.*

### Linux & macOS

```
curl -s -o bitwarden.sh \
    https://raw.githubusercontent.com/open-bitwarden/server/master/scripts/bitwarden.sh \
    && chmod +x bitwarden.sh
./bitwarden.sh install
./bitwarden.sh start
```

### Windows

```
Invoke-RestMethod -OutFile bitwarden.ps1 `
    -Uri https://raw.githubusercontent.com/open-bitwarden/server/master/scripts/bitwarden.ps1
.\bitwarden.ps1 -install
.\bitwarden.ps1 -start
```
### Using without Licence
Currently we just overruled the checks on licences.
You can safely include the 2 included beta licence keys (under /licences) to bybass licencing.
Just use them like you would use a normal licence.

## Contribute

Code contributions are welcome! Visual Studio or VS Code is highly recommended if you are working on this project. Please commit any pull requests against the `master` branch.

Security audits and feedback are welcome. Please open an issue or email us privately if the report is sensitive in nature. You can read our security policy in the [`SECURITY.md`](SECURITY.md) file. We also run a program on [HackerOne](https://hackerone.com/bitwarden).
