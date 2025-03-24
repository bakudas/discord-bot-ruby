# frozen_string_literal: true

module Alongamento
  extend Discordrb::Commands::CommandContainer

  command :alongamento, {
    help_available: true,
    usage: '!alongamento',
    description: 'Uma breve seleção de alongamentos para evitar lesões ao passar muito tempo na frente do pc.',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/alongamento.png', 'r'))
  end
end
