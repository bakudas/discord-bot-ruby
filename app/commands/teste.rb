# frozen_string_literal: true

module Teste
  extend Discordrb::Commands::CommandContainer

  command :teste, {
    help_available: true,
    usage: '!nimi',
    min_args: 0
  } do |event|
    event << "AAAAAAAAAAAAAAAAAAAAA"
  end
end