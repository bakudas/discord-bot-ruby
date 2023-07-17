# frozen_string_literal: true

module Top
  extend Discordrb::Commands::CommandContainer

  command :top, {
    help_available: true,
    usage: '!top',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/top.gif', 'r'))
  end
end
