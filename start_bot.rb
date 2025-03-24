# frozen_string_literal: true

require 'open3'
require './app/utils/bot_monitor'

def start_bot
  # Inicia o bot em um processo separado
  bot_process = Open3.popen2e('ruby app/bot.rb') do |stdin, stdout_and_stderr, wait_thr|
    # Inicializa o monitor
    monitor = BotMonitor.new(wait_thr)

    # Inicia o monitoramento em uma thread separada
    monitor_thread = Thread.new { monitor.start_monitoring }

    # Monitora a saída do bot
    while line = stdout_and_stderr.gets
      puts line
    end

    # Aguarda o processo terminar
    wait_thr.value
  end
end

# Inicia o bot
start_bot