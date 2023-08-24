# frozen_string_literal: true

require './src/toy_robot_game'
require './src/domain/board'
require './src/domain/robot'

puts 'Welcome to Toy Robot Game!'

game = ToyRobotGame.new(
  table: Board.new(5, 5),
  robot: Robot.new
)

loop do
  input_data = gets
  command = input_data
  game.process(command)

  break command if /exit/ =~ command
end
