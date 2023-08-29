# frozen_string_literal: true

require_relative '../src/toy_robot_game'
require_relative '../src/domain/table'
require_relative '../src/domain/robot'

describe ToyRobotGame do
  describe '#process' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }
    let(:toy_robot_game) { described_class.new(table: table, robot: robot) }

    context 'when Commands::Processor fails' do
      it 'rescues an instance of StandardError and add it to the errors array' do
        expect do
          toy_robot_game.process('INVALID COMMAND')
        end.to change {
          toy_robot_game.errors.size
        }.by(1)
        expect(toy_robot_game.errors).to include(an_instance_of(CustomExceptions::CommandInvalidError))
      end
    end

    context 'when Commands::Processor succeeds' do
      it 'executes the processor call method without errors' do
        expect do
          toy_robot_game.process('PLACE 0,0,NORTH')
        end.not_to(change { toy_robot_game.errors.size })

        expect(toy_robot_game.errors).to be_empty
      end
    end
  end
end
