# frozen_string_literal: true

module Dado
  extend Discordrb::Commands::CommandContainer

  command :d, {
    help_available: true,
    usage: '!d 20',
    min_args: 1
  } do |event, sides|
    result = rand(1..sides.to_i).round
    event << "#{event.user.name}, você tirou no dado :game_die:: #{result}"
  end
end