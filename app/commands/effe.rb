# frozen_string_literal: true

module Effe
  extend Discordrb::Commands::CommandContainer

  command :effe, {
    help_available: true,
    usage: '!effe',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/EfeVacinado.jpg', 'r'))
  end
end
