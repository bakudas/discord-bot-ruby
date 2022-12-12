# frozen_string_literal: true

tool "commands" do
  def run
    puts Dir.chdir("./app/commands") {Dir.glob("*.rb")}.map {|c| c[0...-3]}
  end
end
