# Workshop Requirements

Everything you need to follow along with the **Advanced Pester Workshop** at PSConfEU 2026.

Please install and verify the **required** software *before* the workshop starts — we won't have time to troubleshoot installs in the room.

## Required

| Tool | Version | Notes |
|------|---------|-------|
| **PowerShell** | 7.4 or newer | The module declares `PowerShellVersion = '7.4'`. Windows PowerShell 5.1 is **not** supported. |
| **Pester** | 5.5.0 or newer | The test runner hard-fails on anything older. |
| **Git** | any recent | To clone this repository. |
| A code editor | — | **VS Code** with the *PowerShell* extension is recommended, but any editor works. |

### PowerShell 7.4+

- Download / install instructions: <https://learn.microsoft.com/powershell/scripting/install/installing-powershell>
- Verify:

  ```powershell
  $PSVersionTable.PSVersion   # should be 7.4.0 or higher
  ```

### Pester 5.5.0+

```powershell
Install-Module Pester -MinimumVersion 5.5.0 -Force -SkipPublisherCheck
Import-Module Pester -MinimumVersion 5.5.0
Get-Module Pester    # confirm 5.5.0+ is loaded
```

- Project: <https://pester.dev/>

### Get the workshop content

```powershell
git clone https://github.com/powershellpr0mpt/PesterWorkshop26.git
cd PesterWorkshop26
```

### Smoke test

Confirm your machine is ready by running the unit tests:

```powershell
./build/Invoke-Tests.ps1 -Tag Unit
```

You should initially expect 32 passed, 2 failed and 3 notrun tests.  
Due to this being a workshop you will have to "fix" or expand the current tests.

## Optional

### Docker / Podman (containerised API + tests)

> [!NOTE]
> The container files (`Dockerfile.api`, `Dockerfile.tests`, `docker-compose.yml`) are
> provided **for learning reference only**. We will **not** actively run containers
> during the workshop, so you do **not** need Docker or Podman installed to attend.
> They're here so you can explore the CI-style integration setup on your own afterwards.

You can run the compose stack with either **Docker** or **Podman** (Podman ships a
`docker compose`-compatible CLI):

- **Docker** — <https://docs.docker.com/get-docker/>
- **Podman** — <https://podman.io/docs/installation> (plus `podman compose` / `podman-compose`)

Example (Docker syntax; swap `docker` for `podman` to use Podman):

```bash
# Start the mock API
docker compose up -d api

# Run integration + acceptance tests against it
docker compose run --rm --build tests

# Tear down
docker compose down
```

The same images are built on Alpine using `mcr.microsoft.com/powershell:7.4-alpine-3.20`.

## What you do NOT need

- An internet connection during the workshop (beyond the initial clone / installs) — the API is a local PowerShell `HttpListener` mock.
- A real PSConfEU Conference API key — everything runs locally.
- A cloud account or CI service — the `.github/workflows/` examples are demo-led; you read them, you don't have to run them.
