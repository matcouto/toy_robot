# frozen_string_literal: true

require './src/toy_robot_game'
require './src/services/commands/processor_factory'
require './src/domain/table'
require './src/domain/robot'

def main
  display_welcome_message
  logger = Logger.new($stdout)
  toy_robot_game = setup_toy_robot_game(logger)

  loop do
    command = gets.chomp.upcase
    break if command == 'EXIT'

    toy_robot_game.run(command)
  rescue Interrupt
    puts "\nExiting..."
    break
  end
end

def display_welcome_message
  project_root = File.expand_path('..', 'toy_robot')
  welcome_message_path = File.join(project_root, 'docs', 'welcome_message.txt')
  puts File.read(welcome_message_path)
end

def setup_toy_robot_game(logger)
  table = Table.new(5, 5)
  robot = Robot.new
  processor_factory = Commands::ProcessorFactory.new(table, robot)
  ToyRobotGame.new(table: table, robot: robot, processor_factory: processor_factory, logger: logger)
end

main
