# Running on Windows

The stack runs unchanged on a Windows gaming PC with Docker Desktop.

1. Install **Docker Desktop** with the WSL 2 backend.
2. Clone the repo **inside WSL** (e.g. `~/dwellers-galaxy`), not under `C:\`:
   bind mounts from the Windows filesystem are much slower for world data.
3. In WSL: `./scripts/mcctl setup` and `./scripts/mcctl up`.
4. Allow the port once in an elevated PowerShell:

   ```powershell
   New-NetFirewallRule -DisplayName "Minecraft 25565" -Direction Inbound -Protocol TCP -LocalPort 25565 -Action Allow
   ```

5. For friends outside your network, forward TCP 25565 on the router to the PC
   (or use a VPN like Tailscale instead of opening a port).

Memory: with 64 GB RAM, `MC_MEMORY=8G` and `MC_CONTAINER_LIMIT=10g` leave plenty for gaming at the same time.
Docker Desktop's WSL VM limit is set in `%UserProfile%\.wslconfig` (`memory=16GB`).
