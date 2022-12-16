# bot.rb

require 'discordrb'
require 'dotenv/load'
require './app/utils/load_commands'

Dotenv.require_keys('DISCORD_TOKEN') # required keys and tokens

bot = Discordrb::Commands::CommandBot.new(token: ENV['DISCORD_TOKEN'], name: 'Purple Bit', prefix: '!', intents: [:server_messages]) # initializing the bot

#bot = Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'], intents: [:server_messages]) # initializing the bot

date = Time.now.ctime

LoadCommands.new bot

puts '-----------------------------------------'
puts "Logado como: #{bot.name} às #{date}"
puts '-----------------------------------------'
puts 'Comandos carregados:'

bot.commands.sort.each { |symbol, _command, _command_alias| puts symbol }

bot.run