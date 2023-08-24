# frozen_string_literal: true

module Commands
  class Base
    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    def call(arguments = nil)
      raise NotImplementedError
    end

    def position_within_bounds?(position)
      !position.nil? &&
        @table.position_within_bounds?(position)
    end
  end
end
