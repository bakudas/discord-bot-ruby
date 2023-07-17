require 'dotenv/load'
require "uri"
require "net/http"
require 'discordrb/webhooks'
require './app/utils/get_data'

Dir.glob("./app/commands/*.rb").reject { |file| require file }

class LoadCommands
  include Discordrb::Commands::CommandContainer

  def initialize bot

    cmd_list = []

    Dir.glob("./app/commands/*.rb").reject { |file| cmd_list << file.split("/").last.split(".").first.capitalize }

    cmd_list.each { |command| bot.include!(Module.const_get command) }

    # AUDIOS
    bot.command :bomdia do |event|
      bot.send_file(event.channel, File.open('./app/data/audio/bomdiaSebby.mp3', 'r'))
    end
    
    bot.command :essabarra do |event|
      bot.send_file(event.channel, File.open('./app/data/audio/essabarra.mp3', 'r'))
    end
    
    bot.command :superhot do |event|
      bot.send_file(event.channel, File.open('./app/data/audio/superhot.mp3', 'r'))
    end
    
    bot.command(:eval, help_available: false) do |event, *code|
      break unless event.user.id == 194927916268781569 # Replace number with your ID
      
      begin
        eval code.join(' ')
      rescue StandardError
        'An error occurred 😞'
      end
    end
  end
end
