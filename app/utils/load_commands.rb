Dir.glob("./app/commands/*.rb").reject { |file| require file }

class LoadCommands
  include Discordrb::Commands::CommandContainer

  def initialize bot
    cmd_list = []

    Dir.glob("./app/commands/*.rb").reject { |file| cmd_list << file.split("/").last.split(".").first.capitalize }

    cmd_list.each { |command| bot.include!(Module.const_get command) }
  end
end
