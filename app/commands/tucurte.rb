# frozen_string_literal: true

module Tucurte
  extend Discordrb::Commands::CommandContainer

  command :tucurte, {
    help_available: true,
    usage: '!tucurte',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/tucurte.jpg', 'r'))
  end
end
