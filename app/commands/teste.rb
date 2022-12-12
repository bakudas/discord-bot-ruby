# frozen_string_literal: true

module Teste
  attr_reader :commands

  include Discordrb::Commands::CommandContainer

  def initialize
    @commands = teste
  end

end