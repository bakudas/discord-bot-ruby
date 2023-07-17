# frozen_string_literal: true
require "./app/utils/get_data"
module Gato
  extend Discordrb::Commands::CommandContainer

  command :gato, {
    help_available: true,
    usage: '!gato',
    description: 'Gifs de gatinhos fofinhos. (api: thecatapi.com)',
    min_args: 0
  } do |event|
    cat_api = "https://api.thecatapi.com/v1/images/search?mime_types=gif"

    cat = GetData.new cat_api

    cat.response[0]["url"]
  end
end
