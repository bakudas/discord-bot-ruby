# frozen_string_literal: true

module Funko
  extend Discordrb::Commands::CommandContainer

  command :funko, {
    help_available: true,
    usage: '!funko',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/funko-vaca.png', 'r'))
  end
end
