# frozen_string_literal: true

module Concordo
  extend Discordrb::Commands::CommandContainer

  command :concordo, {
    help_available: true,
    usage: '!concordo',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/concordo.gif', 'r'))
  end
end
