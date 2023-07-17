# frozen_string_literal: true

module Lulz
  extend Discordrb::Commands::CommandContainer

  command :lulz, {
    help_available: true,
    usage: '!lulz',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/lulz.png', 'r'))
  end
end
