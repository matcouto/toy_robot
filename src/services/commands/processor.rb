# frozen_string_literal: true

require './src/services/commands/move'
require './src/services/commands/place'
require './src/services/commands/report'
require './src/services/commands/rotate'
require './src/util/custom_exceptions'
module Commands
  class Processor
    include CustomExceptions

    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    COMMANDS = {
      'PLACE' => Commands::Place,
      'MOVE' => Commands::Move,
      'LEFT' => Commands::Rotate,
      'RIGHT' => Commands::Rotate,
      'REPORT' => Commands::Report
    }.freeze

    def call(command)
      command_name = parse_command(command)

      raise CommandInvalidError, command_name unless COMMANDS.key?(command_name)
      return unless robot.placed? || command_name == 'PLACE'

      COMMANDS[command_name].new(
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
