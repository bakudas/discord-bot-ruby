# frozen_string_literal: true

module Superhot
  extend Discordrb::Commands::CommandContainer

  command :superhot, {
    help_available: true,
    usage: '!superhot',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/audio/superhot.mp3', 'r'))
  end
end
