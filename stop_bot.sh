#!/bin/bash

if [ -f bot.pid ]; then
    PID=$(cat bot.pid)
    echo "Parando o bot (PID: $PID)..."
    kill $PID
    rm bot.pid
    echo "Bot parado com sucesso!"
else
    echo "Arquivo bot.pid não encontrado. O bot pode não estar rodando."
fi