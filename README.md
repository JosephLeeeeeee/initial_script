# initial_script
Quick initialization for GPU cluster

## Quick start
git, git-lfs, tmux, nload, iproute2, lsof are installed

pip is upgraded, gpustat, modelscope, rclone are installed

vpn (mihomo) is installed

Claude Code is installed via npm, miniconda is installed (though uv is recommended)

Change the following scripts by order: bashrc -> vpn -> rclone -> initial script

2004/ is for Ubuntu 20.04, 2204/ is for Ubuntu 22.04

### bashrc
`bashrc`
Change ws to your workspace
Change zos to your bucket

### vpn
`/vpn/config.yaml`
Change config.yaml to your vpn configuration

### rclone
`rclone.conf`
Add your bucket information

### initial script
`initial_system.sh`
Modify if needed.
Run `source initial_system.sh`

## Reference

Many thanks to nelvko! You can install vpn in any cluster with cli and without sudo.
[https://github.com/nelvko/clash-for-linux-install](https://github.com/nelvko/clash-for-linux-install)

If you have any problem, please submit issue and pr.
