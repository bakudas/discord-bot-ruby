# frozen_string_literal: true

module Show
  extend Discordrb::Commands::CommandContainer

  command :show, {
    help_available: true,
    usage: '!show',
    description: '',
    min_args: 0
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/show.gif', 'r'))
  end
end
