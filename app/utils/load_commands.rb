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

    bot.command :discordo do |event|
      bot.send_file(event.channel, File.open('./app/data/images/discordo.gif', 'r'))
    end
    
    bot.command :effe do |event|
      bot.send_file(event.channel, File.open('./app/data/images/EfeVacinado.jpg', 'r'))
    end
    
    bot.command :excuse do |event|
      bot.send_file(event.channel, File.open('./app/data/images/excuse.gif', 'r'))
    end
    
    bot.command :fumito do |event|
      bot.send_file(event.channel, File.open('./app/data/images/fumito.png', 'r'))
    end
    
    bot.command :funko do |event|
      bot.send_file(event.channel, File.open('./app/data/images/funko_vaca.png', 'r'))
    end
    
    bot.command :kek do |event|
      bot.send_file(event.channel, File.open('./app/data/images/kek.gif', 'r'))
    end
    
    bot.command :lulz do |event|
      bot.send_file(event.channel, File.open('./app/data/images/lulz.png', 'r'))
    end
    
    bot.command :meudeus do |event|
      bot.send_file(event.channel, File.open('./app/data/images/meudeus.png', 'r'))
    end
    
    bot.command :pixelart101 do |event|
      bot.send_file(event.channel, File.open('./app/data/images/pixelart101.png', 'r'))
    end
    
    bot.command :raffamoreiraman do |event|
      bot.send_file(event.channel, File.open('./app/data/images/raffamoreiraman.gif', 'r'))
    end
    
    bot.command :regras do |event|
      regras = ['./app/data/images/regras01.jpg', 'app/data/images/regras02.png', 'app/data/images/regras03.jpg']
      bot.send_file(event.channel, File.open(regras[rand(3)], 'r'))
    end
    
    bot.command :show do |event|
      bot.send_file(event.channel, File.open("./app/data/images/show.gif", 'r'))
    end
    
    bot.command :top do |event|
      bot.send_file(event.channel, File.open("./app/data/images/top.gif", 'r'))
    end
    
    bot.command :topkek do |event|
      bot.send_file(event.channel, File.open("./app/data/images/topkek.png", 'r'))
    end
    
    bot.command :tucurte do |event|
      bot.send_file(event.channel, File.open("./app/data/images/tucurte.jpg", 'r'))
    end
    
    bot.command :gato do |_event|
      cat_api = "https://api.thecatapi.com/v1/images/search?mime_types=gif"
    
      cat = GetData.new cat_api
    
      cat.response[0]["url"]
    end

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
