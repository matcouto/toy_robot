# frozen_string_literal: true

require './src/services/commands/move'
require './src/services/commands/place'
require './src/services/commands/report'
require './src/services/commands/rotate'

module Commands
  class Processor
    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    INPUT_COMMANDS = {
      'PLACE' => Commands::Place,
      'MOVE' => Commands::Move,
      'LEFT' => Commands::Rotate,
      'RIGHT' => Commands::Rotate,
      'REPORT' => Commands::Report
    }.freeze

    def call(command)
      # TODO: Create custom exception for place - Nested exceptions
      command_name = parse_command(command)
      raise "Unknown command: #{command_name}" unless INPUT_COMMANDS.key?(command_name)

      INPUT_COMMANDS[command_name].new(
        table,
        robot
      ).call(command)
    end

    private

    attr_reader :table, :robot

    def parse_command(command)
      command.upcase.split(' ').first
    end
  end
end
