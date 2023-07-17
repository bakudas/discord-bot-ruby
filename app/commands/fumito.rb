# frozen_string_literal: true

module Fumito
  extend Discordrb::Commands::CommandContainer

  command :fumito, {
    help_available: true,
    usage: '!fumito',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/fumito.png', 'r'))
  end
end
