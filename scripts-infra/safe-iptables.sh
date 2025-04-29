#!/bin/bash

# Script: safe-iptables.sh
# Descrição: Faz backup das regras atuais do iptables, aplica uma nova regra, e salva estado seguro

# --- Configurações iniciais ---
BACKUP_DIR="$HOME/iptables-backups"
BACKUP_FILE="$BACKUP_DIR/iptables-backup-$(date +%Y%m%d-%H%M%S).rules"

# Cria diretório de backup se não existir
mkdir -p "$BACKUP_DIR"

# --- Passo 1: Fazer backup das regras atuais ---
echo "[INFO] Fazendo backup das regras atuais em $BACKUP_FILE..."
sudo iptables-save > "$BACKUP_FILE"

# Verifica se backup foi criado
if [ $? -ne 0 ]; then
    echo "[ERRO] Falha ao criar backup! Abortando para segurança."
    exit 1
fi

echo "[OK] Backup realizado com sucesso."

# --- Passo 2: Aplicar nova regra passada como argumento ---

# Verifica se comando foi passado
if [ $# -eq 0 ]; then
    echo "[USO] ./safe-iptables.sh \"comando iptables\""
    echo "Exemplo: ./safe-iptables.sh 'iptables -A INPUT -p tcp --dport 8081 -j ACCEPT'"
    exit 1
fi

# Aplica o comando iptables recebido
echo "[INFO] Aplicando nova regra: $1"
eval sudo $1

# Verifica se aplicou com sucesso
if [ $? -ne 0 ]; then
    echo "[ERRO] Falha ao aplicar a nova regra. Restaurando backup..."
    sudo iptables-restore < "$BACKUP_FILE"
    echo "[OK] Backup restaurado."
    exit 1
fi

# --- Passo 3: Salvar estado persistente ---
echo "[INFO] Salvando estado atual..."
sudo netfilter-persistent save

echo "[SUCESSO] Nova regra aplicada e salva com sucesso! Backup criado em: $BACKUP_FILE"

