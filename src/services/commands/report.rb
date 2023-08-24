# frozen_string_literal: true

require './src/services/commands/base'

module Commands
  class Report < Base
    def call(_command = nil)
      puts "Output: #{@robot.current_position}"
    end
  end
end
