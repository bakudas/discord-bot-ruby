# frozen_string_literal: true

module Bakratos
  extend Discordrb::Commands::CommandContainer

  command :bakratos, {
    help_available: true,
    usage: "!bakratos",
    min_args: 0,
  } do |event|
    event.bot.send_file(event.channel, File.open('./app/data/images/bakratos.png', 'r'))
  end
end
