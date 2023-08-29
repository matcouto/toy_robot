# frozen_string_literal: true

require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'
require_relative '../../../src/services/commands/place'
require_relative '../../../src/util/custom_exceptions'

describe Commands::Place do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    before { robot.direction = 'NORTH' }

    context 'with a position outside bounds' do
      it 'raises PositionOutOfBounds' do
        expect { subject.call('PLACE 6,3,NORTH') }.to raise_error(CustomExceptions::PositionOutOfBoundsError)
      end
    end

    context 'with an invalid command' do
      it 'raises PositionInvalidError' do
        expect { subject.call('PLACE -6,3,NORTH') }.to raise_error(CustomExceptions::PositionInvalidError)
      end
    end

    context 'with a valid command' do
      it 'does not raise any error' do
        expect { subject.call('PLACE 0,2,NORTH') }.not_to raise_error
      end

      it 'places the robot at the given position' do
        robot.position = nil
        subject.call('PLACE 0,3,NORTH')

        expect(robot.current_position).to eq '0,3,NORTH'
      end
    end

    context 'with an invalid direction' do
      it 'raises DirectionInvalidError' do
        expect { subject.call('PLACE 2,3,NORTHERN') }.to raise_error(CustomExceptions::DirectionInvalidError)
      end
    end
  end
end
