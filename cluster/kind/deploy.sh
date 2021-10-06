bin_dir=/usr/local/bin
kind_version=0.11.0

install_kind() {
    echo 'Installing kind...'

    mkdir -p "${bin_dir}"

    curl -sSLo "${bin_dir}/kind" "https://github.com/kubernetes-sigs/kind/releases/download/${kind_version}/kind-linux-amd64"
    chmod +x "${bin_dir}/kind"
}