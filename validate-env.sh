#!/bin/bash

# Validador básico de arquivo ./.env
ENV_FILE="$1"

if [ -z "$ENV_FILE" ]; then
  echo "🚨 Por favor, forneça o caminho do arquivo ./.env"
  exit 1
fi

if [ ! -f "$ENV_FILE" ]; then
  echo "🚨 Arquivo não encontrado: $ENV_FILE"
  exit 2
fi

echo "📚 Validando arquivo: $ENV_FILE"
echo ""

line_number=0
while IFS= read -r line || [ -n "$line" ]; do
  line_number=$((line_number+1))
  
  # Ignora comentários e linhas em branco
  if [[ "$line" =~ ^#.*$ || "$line" =~ ^[[:space:]]*$ ]]; then
    continue
  fi
  
  # Valida formato correto chave=valor
  if [[ ! "$line" =~ ^[A-Za-z_][A-Za-z0-9_]*=.+$ ]]; then
    echo "❗ Erro na linha $line_number: '$line'"
  fi
done < "$ENV_FILE"

echo ""
echo "✅ Validação finalizada."
