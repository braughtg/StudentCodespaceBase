# StudentCodespaceBase

The StudentCodespaceBase is a Debian Linux container that runs in GitHub Codespaces and provides a GUI desktop, providing a simple low to no cost way for students to spin up a Linux machine for class work, activities or projects.

In addition to the base Debian Liunux and the GUI desktop the following are also installed:
- Docker (via Docker on Docker)
- Git
- GitHub CLI (`gh`)
- Firefox
- `vim`, `nano`
- `wget`, `curl`
- `man`

## Usage

1. Log into GitHub
2. Click the button below to start a new StudentCodespaceBase container or to restart an existing one.
   <br><a href='https://codespaces.new/braughtg/StudentCodespaceBase?quickstart=1'><img src='https://github.com/codespaces/badge.svg' alt='Open in GitHub Codespaces' style='max-width: 100%;'></a>
3. Wait for the codespace to be created (~5 minutes) or restarted (~1 minute). The following message will appear in the "TERMINAL panel" at the bottom of the window when the codespace is ready.
   ```text
   *******************
   Codespace is ready!
   *******************
   ```
5. Open the "PORTS tab" from the menu bar above the "Terminal panel".

   <img src='images/ports-tab.png' alt='The ports tab.' style='max-width: 100%;'>
6. Open the noVNC connection by...
   1. pointing at the `https` link under "Forwarded Address" in the "Ports tab" 
   2. and then either:
      - Right clicking and choosing "Open in Browser".
      - Or by clicking the "Globe" icon.
7. Click on the "noVNC Connect button"

   <img src='images/connect-button.png' alt='The noVNC connect button.' style='max-width: 100%;'>
   - Note: if you restart a codespace and try to reuse a tab that had noVNC running previously the connection will fail. Close the tab and reopen it as described here.
8. Use the "noVNC menu" at the left of the window to set the "Scaling Mode" to "Remove resizing".
  
   <img src='images/scaling-mode.png' alt='Setting the Scaling Mode.' style='max-width: 100%;'>
9. Right click anywhere in the window (i.e. on the GUI Desktop) and open a Terminal to get started.
   - It may take a few moments for the terminal to open the first time.

## Stopping a Codespaces

1. Visit your [Codespaces page](https://github.com/codespaces).
   - If the page was already open, you'll need to reload it to update it with the current status.
2. Click the "..." to the right of the Codespace you want to stop.
3. Choose "Stop codespace".

## Extending the Container

The software installed in the container can be extended in severl ways depending upon your needs.
1. Student Installed Software:  Students running the codespace can install additional software using the `apt` package manager. Any software installed will be availble in the codespace in which it is installed for the life of that codespace.  If the codespace is deleted, then the software is also deleted and will not be installed in a newly created codespace.
2. Pre-Installed Software: To preinstall software for all of the students the instructor should fork this repository and update the `.devcontainer/Dockerfile` or the `.devcontainer/devcontainer.json` file to install the desired software.  Students should then create their codespaces from the fork.
   - Note: the URL of the button under "Launch" above will need to be updated to point at the new fork as well.
3. If you believe there is widely used software that should be in the base container for all students across all courses at all institutions using this repository, add it to the `Dockerfile` or `devcontainer.json` file and make a pull request.  It will be considered.
