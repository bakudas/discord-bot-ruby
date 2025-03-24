#!/bin/bash

# Diretório do projeto
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Criar diretório de logs se não existir
mkdir -p logs

# Nome do arquivo de log com timestamp
LOG_FILE="logs/bot_$(date +%Y%m%d_%H%M%S).log"

# Iniciar o bot em background
nohup bundle exec ruby start_bot.rb > $LOG_FILE 2>&1 &

# Salvar o PID do processo
echo $! > bot.pid

echo "Bot iniciado em background!"
echo "Logs disponíveis em: $LOG_FILE"
echo "PID do processo: $(cat bot.pid)"