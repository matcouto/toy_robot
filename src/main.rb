# frozen_string_literal: true

require 'logger'
require './src/toy_robot_game'
require './src/services/commands/processor_factory'
require './src/domain/table'
require './src/domain/robot'

puts 'Welcome to Toy Robot Game!'

def display_errors(game_errors)
  return if game_errors.nil? || game_errors.empty?

  logger = Logger.new($stdout)
  logger.level = Logger::ERROR
  game_errors.each { |error| logger.error(error) }
end

table = Table.new(5, 5)
robot = Robot.new
processor_factory = Commands::ProcessorFactory.new(table, robot)

game = ToyRobotGame.new(
  table: table,
  robot: robot,
  processor_factory: processor_factory
)

loop do
  command = gets.chomp

  if /exit/ =~ command
    # Displays errors before exiting via 'exit' command
    display_errors(game.errors)
    break
  else
    game.process(command.upcase)
    next
  end
rescue Interrupt
  # Displays errors before exiting via ctrl+c
  display_errors(game.errors)
  break
end
