# frozen_string_literal: true

module Aquaman
  extend Discordrb::Commands::CommandContainer

  command :aquaman, {
    help_available: true,
    usage: '!aquaman',
    description: 'aquaman aquaman viado',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/aquaman.png', 'r'))
  end
end
