mkdir -p ~/.config/mihomo/
cp ./vpn/resources/zip/mihomo-linux-amd64-compatible-v1.19.2.gz ~/
cp ./vpn/resources/Country.mmdb ~/.config/mihomo/
cp ./vpn/config.yaml ~/.config/mihomo/config.yaml
install -D -m +x <(gzip -dc ~/mihomo-linux-amd64-compatible-v1.19.2.gz) ~/bin/mihomo

cat <<'EOF' >~/.config/mihomo/mihomo.sh
mihomo() {
    case $1 in
    on)
        export http_proxy=http://127.0.0.1:7890
        export https_proxy=$http_proxy
        export HTTP_PROXY=$http_proxy
        export HTTPS_PROXY=$http_proxy
        export all_proxy=$http_proxy
        export ALL_PROXY=$http_proxy
        export NO_PROXY="localhost,127.0.0.1,::1"
        pgrep -f mihomo || {
            ~/bin/mihomo -d ~/.config/mihomo/ -f ~/.config/mihomo/config.yaml >& ~/.config/mihomo/log & 
        }
        echo '已开启代理环境'
        ;;
    off)
        unset http_proxy
        unset https_proxy
        unset HTTP_PROXY
        unset HTTPS_PROXY
        unset all_proxy
        unset ALL_PROXY
        unset no_proxy
        unset NO_PROXY
        pkill -9 -f mihomo
        echo '已关闭代理环境'
        ;;
    esac
}
EOF

# Need to turn on VPN when initializing the new system
source ~/.config/mihomo/mihomo.sh
mihomo off
mihomo on
