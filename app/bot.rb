# frozen_string_literal: true
# Discord bot by vacaroxa

require 'discordrb'
require 'dotenv/load'
require 'logger'
require './app/utils/load_commands.rb'

# LOAD ENV
Dotenv.require_keys('DISCORD_TOKEN')

class PurpleBitBot
  MAX_RETRIES = 5
  RETRY_DELAY = 5 # segundos

  def initialize
    @logger = Logger.new($stdout)
    @logger.level = Logger::INFO

    @bot = Discordrb::Commands::CommandBot.new(
      token: ENV['DISCORD_TOKEN'],
      name: 'Purple Bit',
      prefix: '!',
      intents: [:server_messages, :server_members, :server_presences]
    )
  end

  def start
    setup_events
    load_commands
    run_bot
  end

  private

  def setup_events
    @bot.ready do |event|
      @logger.info("Bot iniciado como #{@bot.profile.username}")
      @logger.info("Comandos disponíveis: #{@bot.commands.keys.join(', ')}")
    end

    @bot.disconnected do |event|
      @logger.warn("Bot desconectado! Tentando reconectar...")
      handle_reconnection
    end
  end

  def load_commands
    LoadCommands.new(@bot)
  end

  def handle_reconnection
    retries = 0
    while retries < MAX_RETRIES
      begin
        @bot.run
        break
      rescue StandardError => e
        retries += 1
        @logger.error("Tentativa #{retries} falhou: #{e.message}")
        sleep(RETRY_DELAY)
      end
    end

    if retries >= MAX_RETRIES
      @logger.error("Número máximo de tentativas de reconexão atingido")
      exit(1)
    end
  end

  def run_bot
    begin
      @bot.run
    rescue StandardError => e
      @logger.error("Erro fatal: #{e.message}")
      @logger.error(e.backtrace.join("\n"))
      exit(1)
    end
  end
end

# Iniciar o bot
bot = PurpleBitBot.new
bot.start
