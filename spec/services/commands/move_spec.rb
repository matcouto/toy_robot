# frozen_string_literal: true

require_relative '../../../src/services/commands/move'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::Move do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    before { robot.direction = 'NORTH' }

    context 'with a position outside bounds' do
      before { robot.position = Position.new(0, 4) }

      it 'does not change the current position' do
        expect { subject.call }.not_to(change { robot.position.y_axis })
      end
    end

    context 'with a position within bounds' do
      before { robot.position = Position.new(0, 2) }

      it 'does not raise any error' do
        expect { subject.call }.not_to raise_error
      end
    end

    context 'when current direction is NORTH' do
      before do
        robot.direction = 'NORTH'
        robot.position = Position.new(0, 2)
      end

      it 'moves the robot one position to the North' do
        expect { subject.call }.to change { robot.position.y_axis }.by(1)
      end
    end

    context 'when current direction is EAST' do
      before do
        robot.direction = 'EAST'
        robot.position = Position.new(0, 2)
      end

      it 'moves the robot one position to the East' do
        expect { subject.call }.to change { robot.position.x_axis }.by(1)
      end
    end

    context 'when current direction is SOUTH' do
      before do
        robot.direction = 'SOUTH'
        robot.position = Position.new(2, 2)
      end

      it 'moves the robot one position to the South' do
        expect { subject.call }.to change { robot.position.y_axis }.by(-1)
      end
    end

    context 'when current direction is WEST' do
      before do
        robot.direction = 'WEST'
        robot.position = Position.new(2, 2)
      end

      it 'moves the robot one position to the South' do
        expect { subject.call }.to change { robot.position.x_axis }.by(-1)
      end
    end
  end
end
