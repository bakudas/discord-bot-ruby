# frozen_string_literal: true

module Pixelart101
  extend Discordrb::Commands::CommandContainer

  command :pixelart101, {
    help_available: true,
    usage: '!pixelart101',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/pixelart101.png', 'r'))
  end
end
