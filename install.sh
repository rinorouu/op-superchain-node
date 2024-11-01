#!/bin/bash

echo "=== Install dulu ya Dependensi untuk OP Superchain Node ==="

# Update system dan instal curl dan git
echo "Mengupdate sistem dan menginstal curl dan git..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git

# Instal Docker
echo "Menginstal Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Instal Docker Compose
echo "Menginstal Docker Compose..."
DOCKER_COMPOSE_VERSION="2.0.1"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clone repository OP Stack
echo "Menduplikasi repository OP Stack..."
git clone https://github.com/ethereum-optimism/optimism.git
cd optimism

# Menyiapkan container Docker untuk Superchain Node
echo "Menjalankan container Docker untuk Superchain Node..."
sudo docker-compose -f ./docker-compose.yml up -d

echo "=== Instalasi selesai! Silakan logout dan login kembali agar perubahan grup Docker berlaku. ==="
echo "Untuk menjalankan node, masuk ke direktori 'optimism' dan gunakan perintah: 'docker-compose up'."
