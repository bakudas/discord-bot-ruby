# frozen_string_literal: true

module Essabarra
  extend Discordrb::Commands::CommandContainer

  command :essabarra, {
    help_available: true,
    usage: '!essabarra',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/audio/essabarra.mp3', 'r'))
  end
end
