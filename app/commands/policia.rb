# frozen_string_literal: true

module Policia
  extend Discordrb::Commands::CommandContainer

  command :policia, {
    help_available: true,
    usage: '!policia',
    description: '',
    min_args: 0
  } do |event|
    event << "\n<:vacacop:417882011378909184>  <:vacacop:417882011378909184>"
    event << "\n:rotating_light: :rotating_light:"
    event << "#{event.user.name}, declara que para fins de investigação policial,"
    event << "não ter envolvimento com este grupo e não saber como"
    event << "está no mesmo, provavelmente foi inserido por terceiros,"
    event << "declara também que está disposto e apto a colaborar com "
    event << "as investigações e se apresentar para depoimento "
    event << "caso seja necessário."
    event << "\n<:vacacop:417882011378909184>  <:vacacop:417882011378909184>"
    event << "\n:rotating_light: :rotating_light:"
  end
end
