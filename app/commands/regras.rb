# frozen_string_literal: true

module Regras
  extend Discordrb::Commands::CommandContainer

  command :regras, {
    help_available: true,
    usage: '!regras',
    description: '',
    min_args: 0
  } do |event|
    regras = ['./app/data/images/regras01.jpg', 'app/data/images/regras02.png', 'app/data/images/regras03.jpg']
    bot.send_file(event.channel, File.open(regras[rand(3)], 'r'))  end
end
