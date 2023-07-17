# frozen_string_literal: true

module Raffamoreiraman
  extend Discordrb::Commands::CommandContainer

  command :raffamoreiraman, {
    help_available: true,
    usage: '!raffamoreiraman',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/raffamoreiraman.gif', 'r'))
  end
end
