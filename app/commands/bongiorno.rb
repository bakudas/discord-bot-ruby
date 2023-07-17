# frozen_string_literal: true

module Bongiorno
  extend Discordrb::Commands::CommandContainer

  command :bongiorno, {
    help_available: true,
    usage: '!bongiorno',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/bongiornogif.gif', 'r'))
  end
end
