# frozen_string_literal: true

module Kek
  extend Discordrb::Commands::CommandContainer

  command :kek, {
    help_available: true,
    usage: '!kek',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/kek.gif', 'r'))
  end
end
