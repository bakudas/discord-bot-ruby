# frozen_string_literal: true

module Bomdia
  extend Discordrb::Commands::CommandContainer

  command :bomdia, {
    help_available: true,
    usage: '!bomdia',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/audio/bomdiaSebby.mp3', 'r'))
  end
end
