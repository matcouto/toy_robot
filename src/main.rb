# frozen_string_literal: true

require './src/toy_robot_game'
require './src/domain/table'
require './src/domain/robot'

puts 'Welcome to Toy Robot Game!'

game = ToyRobotGame.new(
  table: Table.new(5, 5),
  robot: Robot.new
)

loop do
  command = gets.chomp

  if /exit/ =~ command
    if game.errors.any?
      puts '===' * 20
      puts game.errors
      puts '===' * 20
    end

    break command
  else
    game.process(command)
    next
  end
end
