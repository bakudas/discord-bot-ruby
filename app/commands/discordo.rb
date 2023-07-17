# frozen_string_literal: true

module Discordo
  extend Discordrb::Commands::CommandContainer

  command :discordo, {
    help_available: true,
    usage: '!discordo',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/discordo.gif', 'r'))
  end
end
