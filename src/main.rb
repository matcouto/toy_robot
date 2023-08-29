# frozen_string_literal: true

require './src/toy_robot_game'
require './src/services/commands/processor_factory'
require './src/domain/table'
require './src/domain/robot'

puts 'Welcome to Toy Robot Game!'

def display_errors(game_errors)
  return if game_errors.nil? || game_errors.empty?

  puts '==== Errors found during execution ===='
  puts game_errors
  puts '=' * 39
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
    display_errors(game.errors)
    break
  else
    game.process(command)
    next
  end
end
