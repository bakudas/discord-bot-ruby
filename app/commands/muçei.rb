# frozen_string_literal: true

module Muçei
  extend Discordrb::Commands::CommandContainer

  command :muçei, {
    help_available: true,
    usage: '!muçei',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/buximchei.png', 'r'))
  end
end
