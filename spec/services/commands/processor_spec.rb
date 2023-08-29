# frozen_string_literal: true

require_relative '../../../src/services/commands/processor'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::Processor do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    before do
      robot.position = Position.new(0, 2)
      robot.direction = 'NORTH'
    end

    context 'when command is invalid' do
      let(:command) { 'INVALID_LEFT' }

      it 'raises CommandInvalidError' do
        expect { subject.call(command) }.to raise_error(CustomExceptions::CommandInvalidError)
      end
    end

    context 'when robot is not placed' do
      let(:command) { 'LEFT' }

      it 'raises RobotNotPlacedError' do
        robot.position = nil
        expect { subject.call(command) }.to raise_error(CustomExceptions::RobotNotPlacedError)
      end
    end

    context 'when command is valid' do
      let(:command) { 'LEFT' }

      it 'does not raise any error' do
        expect { subject.call(command) }.not_to raise_error
      end

      it 'calls the command passed into #call method' do
        robot.direction = 'NORTH'
        expect { subject.call(command) }.to change { robot.direction }.to('WEST')
      end
    end
  end
end
