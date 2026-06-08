#!/usr/bin/env bash

curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.28.15+k3s1 sh -s - --node-ip=192.168.56.110 --write-kubeconfig-mode=644
rm -f /usr/local/bin/k
cat <<'EOF' >/usr/local/bin/k
#!/usr/bin/env sh
exec kubectl "$@"
EOF
chmod 755 /usr/local/bin/k
echo "alias k='kubectl'" >> /home/vagrant/.bashrc

