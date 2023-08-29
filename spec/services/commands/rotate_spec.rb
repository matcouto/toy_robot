# frozen_string_literal: true

require_relative '../../../src/services/commands/rotate'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::Rotate do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    before { robot.direction = 'NORTH' }

    context 'when command is invalid' do
      let(:command) { 'INVALID_LEFT' }

      it 'raises CommandInvalidError' do
        expect { subject.call(command) }.to raise_error(CustomExceptions::CommandInvalidError)
      end
    end

    context 'when passing RIGHT command' do
      it 'rotates the robot to the next direction clockwise' do
        expect { subject.call('RIGHT') }.to change { robot.direction }.to('EAST')
      end
    end

    context 'when passing LEFT command' do
      it 'rotates the robot to the next direction anticlockwise' do
        expect { subject.call('LEFT') }.to change { robot.direction }.to('WEST')
      end
    end
  end
end
