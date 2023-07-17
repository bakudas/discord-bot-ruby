# frozen_string_literal: true

module Meudeus
  extend Discordrb::Commands::CommandContainer

  command :meudeus, {
    help_available: true,
    usage: '!meudeus',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/meudeus.png', 'r'))
  end
end
