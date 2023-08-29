# frozen_string_literal: true

require_relative '../src/domain/table'
require_relative '../src/domain/robot'
require_relative '../src/services/commands/processor_factory'
require_relative '../src/toy_robot_game'

describe ToyRobotGame do
  describe '#run' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }
    let(:fake_logger) { double('Logger', error: nil) }
    let(:processor_factory) { Commands::ProcessorFactory.new(table, robot) }
    let(:toy_robot_game) do
      described_class.new(
        table: table,
        robot: robot,
        processor_factory: processor_factory,
        logger: fake_logger
      )
    end

    context 'when processing a given command fails' do
      before { allow(fake_logger).to receive(:error) }

      it 'logs an error' do
        toy_robot_game.run('FOOBAR')

        expect(fake_logger).to have_received(:error).with('Invalid command: FOOBAR')
      end
    end

    context 'when processing a given command succeeds' do
      it 'executes the processor call method without errors' do
        expect(fake_logger).not_to receive(:error)
        expect(robot.placed?).to be(false)

        toy_robot_game.run('PLACE 0,0,NORTH')

        expect(robot.placed?).to be(true)
      end
    end
  end
end
