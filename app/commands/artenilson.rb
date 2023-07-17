# frozen_string_literal: true

module Artenilson
  extend Discordrb::Commands::CommandContainer

  command :artenilson, {
    help_available: true,
    usage: '!artenilson',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/artenilson.png', 'r'))
  end
end
