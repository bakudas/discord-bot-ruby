# frozen_string_literal: true

module Excuse
  extend Discordrb::Commands::CommandContainer

  command :excuse, {
    help_available: true,
    usage: '!excuse',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/excuse.gif', 'r'))
  end
end
