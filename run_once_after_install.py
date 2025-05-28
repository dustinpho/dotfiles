#!/usr/bin/env python3
"""thank you, chatgpt"""

import os
import subprocess
import shutil
import sys
import platform


def run(cmd, check=True, shell=False):
    print(f"[chezmoi] Running: {' '.join(cmd) if isinstance(cmd, list) else cmd}")
    subprocess.run(cmd, check=check, shell=shell)


def maybe_install_brew():
    print("[chezmoi] Checking if Homebrew is installed...")

    # Check if Homebrew is already installed
    if shutil.which("brew"):
        print("[chezmoi] Homebrew is already installed.")
        return

    # Install Homebrew (for macOS or Linux)
    print("[chezmoi] Installing Homebrew...")
    if platform.system() in ["Darwin", "Linux"]:
        run(
            [
                "/bin/bash",
                "-c",
                '"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
            ],
            shell=True,
        )
    else:
        print(f"[chezmoi] unsupported OS {platform.system()=}.")
        sys.exit(1)

    assert shutil.which("brew")


def install_packages():
    print("[chezmoi] Installing system packages...")

    maybe_install_brew()
    run(
        [
            "brew",
            "install",
            "git",
            "zsh",
            "curl",
            "tmux",
            "nvim",
            "fzf",
            "node",
            "black",
            "ripgrep",
            "fd",
            "luarocks",
            "git-delta",
            "vimpager",
        ]
    )
    run(["brew", "install", "--cask", "font-powerline-symbols"])


def install_tmux_plugins():
    print("[chezmoi] Installing Tmux Plugin Manager (TPM)...")
    tpm_dir = os.path.expanduser("~/.tmux/plugins/tpm")
    if not os.path.isdir(tpm_dir):
        run(["git", "clone", "https://github.com/tmux-plugins/tpm", tpm_dir])

    if shutil.which("tmux"):
        run(["tmux", "start-server"])
        run(["tmux", "new-session", "-d"])
        run([os.path.join(tpm_dir, "bin/install_plugins")])
        run(["tmux", "kill-server"])
        print("[chezmoi] Tmux plugins installed.")


def install_ohmyzsh_and_p10k():
    print("[chezmoi] Installing oh-my-zsh...")
    omz_dir = os.path.expanduser("~/.oh-my-zsh")
    if not os.path.isdir(omz_dir):
        run(
            [
                "sh",
                "-c",
                "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)",
            ],
            shell=True,
        )

    print("[chezmoi] Installing Powerlevel10k...")
    p10k_dir = os.path.expanduser("~/.oh-my-zsh/custom/themes/powerlevel10k")
    if not os.path.isdir(p10k_dir):
        run(
            [
                "git",
                "clone",
                "--depth=1",
                "https://github.com/romkatv/powerlevel10k.git",
                p10k_dir,
            ]
        )

    # Change shell to zsh
    print("[chezmoi] Please set your default shell to zsh using: chsh -s zsh")
    # zsh_path = shutil.which("zsh")
    # if os.environ.get("SHELL") != zsh_path and zsh_path:
    #     run(["chsh", "-s", zsh_path])


def install_rust():
    print("[chezmoi] Installing Rust ecosystem...")

    if not shutil.which("rustup"):
        run(
            [
                "curl",
                "--proto",
                "=https",
                "--tlsv1.2",
                "-sSf",
                "https://sh.rustup.rs",
                "|",
                "sh",
                "-s",
                "--",
                "-y",
            ],
            shell=True,
        )
        os.environ["PATH"] += f":{os.path.expanduser('~')}/.cargo/bin"

    print("[chezmoi] Installing rust-analyzer, rustfmt, clippy, and cargo tools...")
    run(["rustup", "update"])
    run(["rustup", "component", "add", "rustfmt"])
    run(["rustup", "component", "add", "clippy"])

    # Install rust-analyzer (via Homebrew, or use prebuilt binary if you prefer)
    if not shutil.which("rust-analyzer"):
        run(["brew", "install", "rust-analyzer"])

    # Useful cargo subcommands
    run(["cargo", "install", "cargo-edit"])
    run(["cargo", "install", "cargo-watch"])


def main():
    install_packages()
    install_tmux_plugins()
    install_ohmyzsh_and_p10k()
    install_rust()

    # Set up fzf keybindings for shell
    run(
        [
            "$(brew --prefix)/opt/fzf/install",
            "--key-bindings",
            "--completion",
            "--no-update-rc",
        ],
        shell=True,
    )

    print("[chezmoi] Setup complete. Restart your terminal.")


if __name__ == "__main__":
    main()
