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

    bot.command :bundifa do |event|
      bot.send_file(event.channel, File.open('./app/data/images/bundifa.gif', 'r'))
    end
    
    bot.command :muçei do |event|
      bot.send_file(event.channel, File.open('./app/data/images/buximchei.png', 'r'))
    end
    
    bot.command :concordo do |event|
      bot.send_file(event.channel, File.open('./app/data/images/concordo.gif', 'r'))
    end
    
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
    
    bot.command :pokemon do |event, pkm|
      if pkm.nil?
        event << "#{event.user.name}, como vou trazer informações do pokemão se não me disse qual?"
        event << 'Tente, por exemplo: `!pokemon pikachu`.'
        return
      end
    
      pkm_url = "https://pokeapi.co/api/v2/pokemon/#{pkm}" # get data from pokeapi v2 -> pokemon name or number
    
      data = GetData.new(pkm_url) # GetData object with following instance variables -> :url, :data
    
      if data.status.eql?"404"
        event << '<:berro_do_trovao:394286932756004865>'
        event << "#{event.user.name}, `#{pkm}` não parece ser um pokemão válido segundo o prof Oak ¬¬"
        event << 'Tem certeza que esse é mesmo o nome de pokemão?'
        return
      end
    
      # WEBHOOK -> #OFFTOPIC
      client = Discordrb::Webhooks::Client.new(url: ENV['WEBHOOK_URL'])
    
      # WEBHOOK -> #SERVIDOR_TESTE
      # client = Discordrb::Webhooks::Client.new(url: ENV['WEBHOOK_URL_TESTE'])
      
      # EMBED
      client.execute do |builder|
        builder.content = 'Quem é esse pokemon?'
        builder.add_embed do |embed|
          embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: data.response["sprites"]["front_default"])
          embed.title = data.response["name"].capitalize
          embed.add_field(name: 'Type', value: "1: #{data.response["types"][0]["type"]["name"]}
                                                2: #{data.response["types"][1] != nil ? data.response["types"][1]["type"]["name"] : "-" }", inline: true)
          embed.add_field(name: 'Initial Moves', value: "1: #{data.response["moves"][0] != nil ? data.response["moves"][0]["move"]["name"] : "-" }
                                                2: #{data.response["moves"][1] != nil ? data.response["moves"][1]["move"]["name"] : "-" }
                                                3: #{data.response["moves"][2] != nil ? data.response["moves"][2]["move"]["name"] : "-" }
                                                4: #{data.response["moves"][3] != nil ? data.response["moves"][3]["move"]["name"] : "-" }", inline: true)
    
          embed.description = " "
          embed.image = Discordrb::Webhooks::EmbedImage.new(url: data.response["sprites"]["other"]["official-artwork"]["front_default"])
          embed.timestamp = Time.now
        end
      end
    
    end
    
    bot.command :policia do |event|
      event << "<:vacacop:417882011378909184>  <:vacacop:417882011378909184>"
      event << ":rotating_light: :rotating_light:"
      event << "#{event.user.name}, declara que para fins de investigação policial,"
      event << "não ter envolvimento com este grupo e não saber como"
      event << "está no mesmo, provavelmente foi inserido por terceiros,"
      event << "declara também que está disposto e apto a colaborar com "
      event << "as investigações e se apresentar para depoimento "
      event << "caso seja necessário."
      event << "<:vacacop:417882011378909184>  <:vacacop:417882011378909184>"
      event << ":rotating_light: :rotating_light:"
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
