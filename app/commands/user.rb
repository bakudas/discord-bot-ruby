# frozen_string_literal: true

module User
  extend Discordrb::Commands::CommandContainer

  command :user, {
    help_available: true,
    usage: '!user',
    min_args: 0
  } do |event|
    event << event.author.name
  end
end