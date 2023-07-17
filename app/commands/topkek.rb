# frozen_string_literal: true

module Topkek
  extend Discordrb::Commands::CommandContainer

  command :topkek, {
    help_available: true,
    usage: '!topkek',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/topkek.png', 'r'))
  end
end
