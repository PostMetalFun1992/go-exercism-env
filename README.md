# Go Exercism Development Environment

A containerized, reproducible, and portable development environment for Go.
It is built on top of **Arch Linux** and includes a curated set of terminal-based tools: **Go**, **Helix** (editor), **Zellij** (multiplexer), **Starship** (prompt), and **Exercism CLI**.

This project follows the **"Environment as a Tool"** philosophy.

## ✨ Features

* **Base:** Arch Linux (Rolling release).
* **Editor:** Helix (`hx`) with pre-configured LSP (`gopls`).
* **Multiplexer:** Zellij with a custom layout (Code + Logs tabs).
* **Shell:** Bash with Starship prompt and persistent history.
* **Permissions:** Docker setup maps your host UID/GID to the container user during build time to avoid permission issues with mounted volumes.
* **Portable:** Configuration files (`helix`, `.bashrc`, layouts) are injected from this repository, keeping your project directories clean.
* **Cache:** Uses Docker named volumes for Go modules and build cache to keep your host system clean and speed up builds.

## 📋 Prerequisites

To run this environment on a "bare metal" host, you only need:

1.  **Docker Engine**
2.  **Docker Compose**
3.  **Git**

> **Note for Linux users:** Ensure your user is added to the `docker` group so you don't need to run scripts with `sudo`.
> (`sudo usermod -aG docker $USER` and re-login).

---

## 🛠️ Build

You need to build the container image once. This script creates the image and passes your current host UID/GID to the container, ensuring file ownership matches your host system.

1.  Clone this repository:
    ```bash
    git clone [https://github.com/your-username/go-exercism-dev.git](https://github.com/your-username/go-exercism-dev.git)
    cd go-exercism-dev
    ```

2.  Run the build script:
    ```bash
    cd ./docker
    ./build.sh
    ```

---

## 🚀 Usage

You can launch this environment from **any directory**. The script automatically detects your current location and mounts it into the container as the project folder.

1.  Navigate to your Go project folder (the code you want to work on):
    ```bash
    cd ~/Projects/go-exercism-src
    ```

2.  Call the `run.sh` script using its absolute path:
    ```bash
    ~/Projects/go-exercism-dev/run.sh
    ```
    *(Replace `~/Projects/go-exercism-dev` with the actual path where you cloned this repo)*

---

## 👩‍💻 Exercism Configuration

To download exercises and submit solutions, you need to link the CLI to your Exercism account.

```bash
# Inside the container:
exercism configure --token=YOUR_TOKEN --workspace=/home/developer/project
```
