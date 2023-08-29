# frozen_string_literal: true

require_relative '../../../src/services/commands/report'
require_relative '../../../src/util/custom_exceptions'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::Report do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    context 'when robot is not placed' do
      it 'raises RobotNotPlacedError' do
        expect { subject.call }.to raise_error(CustomExceptions::RobotNotPlacedError)
      end
    end

    context 'when robot is placed' do
      it 'outputs the Robot current position' do
        robot.direction = 'NORTH'
        robot.position = Position.new(0, 3)
        expect { subject.call }.to output(/Output: 0,3,NORTH/).to_stdout
      end
    end
  end
end
