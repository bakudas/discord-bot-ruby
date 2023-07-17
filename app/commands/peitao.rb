# frozen_string_literal: true

module Peitao
  extend Discordrb::Commands::CommandContainer

  command :peitao, {
    help_available: true,
    usage: '!peitao',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/babyelias.gif', 'r'))
  end
end
