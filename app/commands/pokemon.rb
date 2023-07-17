# frozen_string_literal: true
require 'dotenv/load'
require "uri"
require "net/http"
require 'discordrb/webhooks'
require './app/utils/get_data'

module Pokemon
  extend Discordrb::Commands::CommandContainer

  command :pokemon, {
    help_available: true,
    usage: '!pokemon pikachu',
    description: '',
    min_args: 1
  } do |event, pkm|

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
    # client = Discordrb::Webhooks::Client.new(url: ENV['WEBHOOK_URL'])

    # WEBHOOK -> #SERVIDOR_TESTE
    client = Discordrb::Webhooks::Client.new(url: ENV['WEBHOOK_URL_TESTE'])

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
end
