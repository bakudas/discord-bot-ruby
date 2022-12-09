# bot.rb

require 'discordrb'
require 'dotenv/load'

Dotenv.require_keys("DISCORD_TOKEN") # required keys and tokens

bot = Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'], intents: [:server_messages]) # initializing the bot

bot.message(with_text: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run