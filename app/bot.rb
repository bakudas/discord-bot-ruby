# fronzen_string_literal: true
# Discord bot by vacaroxa

require 'discordrb'
require 'dotenv/load'
require './app/utils/load_commands.rb'

# LOAD ENV
Dotenv.require_keys('DISCORD_TOKEN') # required keys and tokens

# CREATE BOT
bot = Discordrb::Commands::CommandBot.new(token: ENV['DISCORD_TOKEN'], name: 'Purple Bit', prefix: '!', intents: [:server_messages]) # initializing the bot

#bot = Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'], intents: [:server_messages]) # initializing the bot

# GET TIME
date = Time.now.ctime

puts '-----------------------------------------'
puts "- #{bot.name} - #{date} -"

# LOAD ALL COMMANDS
LoadCommands.new bot

puts '-----------------------------------------'
puts '-------- Comandos carregados ------------'

# Print loaded commands
bot.commands.sort.each { |symbol, _command, _command_alias| print "!" + symbol.to_s + ", " }

# BOT RUN
bot.run
