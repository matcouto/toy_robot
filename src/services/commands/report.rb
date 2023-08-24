# frozen_string_literal: true

require './src/command_base'

module Commands
  class Report < CommandBase
    def call(_command = nil)
      puts "Output: #{@robot.current_position}"
    end
  end
end
