# frozen_string_literal: true

require 'logger'
require 'timeout'

class BotMonitor
  def initialize(bot_process)
    @bot_process = bot_process
    @logger = Logger.new($stdout)
    @logger.level = Logger::INFO
    @last_activity = Time.now
    @check_interval = 300 # 5 minutos
  end

  def start_monitoring
    loop do
      check_bot_status
      sleep(@check_interval)
    end
  end

  private

  def check_bot_status
    if process_exited?
      @logger.warn("Bot process terminou inesperadamente. Reiniciando...")
      restart_bot
      return
    end

    if idle_time > 3600 # 1 hora
      @logger.warn("Bot inativo por mais de 1 hora. Reiniciando...")
      restart_bot
      return
    end

    @logger.info("Bot está funcionando normalmente. Tempo inativo: #{idle_time} segundos")
  end

  def process_exited?
    @bot_process.status.nil?
  end

  def idle_time
    Time.now - @last_activity
  end

  def restart_bot
    @logger.info("Iniciando processo de reinicialização...")

    begin
      Timeout.timeout(10) do
        @bot_process.terminate
        @bot_process.wait
      end
    rescue Timeout::Error
      @logger.error("Timeout ao tentar encerrar o processo. Forçando encerramento...")
      @bot_process.kill
    end

    @last_activity = Time.now
    @logger.info("Bot reiniciado com sucesso!")
  end
end