# frozen_string_literal: true

module Bundifa
  extend Discordrb::Commands::CommandContainer

  command :bundifa, {
    help_available: true,
    usage: '!bundifa',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/bundifa.gif', 'r'))
  end
end
