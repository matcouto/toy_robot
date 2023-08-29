# frozen_string_literal: true

require 'logger'
require './src/toy_robot_game'
require './src/services/commands/processor_factory'
require './src/domain/table'
require './src/domain/robot'

def display_welcome_message
  project_root = File.expand_path('..', 'toy_robot')
  welcome_message_path = File.join(project_root, 'docs', 'welcome_message.txt')
  puts File.read(welcome_message_path)
end

def display_errors(game_errors)
  return if game_errors.empty?

  logger = Logger.new($stdout)
  logger.level = Logger::ERROR
  game_errors.each { |error| logger.error(error) }
end

def setup_game
  table = Table.new(5, 5)
  robot = Robot.new
  processor_factory = Commands::ProcessorFactory.new(table, robot)
  ToyRobotGame.new(table: table, robot: robot, processor_factory: processor_factory)
end

def main
  display_welcome_message
  game = setup_game

  loop do
    print '> '

    command = gets.upcase.chomp
    if command == 'EXIT'
      # Displays errors before exiting via 'EXIT' command
      display_errors(game.errors)
      break
    else
      game.process(command.upcase)
    end
  rescue Interrupt
    # Displays errors before exiting via ctrl+c
    display_errors(game.errors)
    break
  end
end

main
