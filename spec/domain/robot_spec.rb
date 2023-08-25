# frozen_string_literal: true

require 'spec_helper'
require_relative '../../src/util/custom_exceptions'
require_relative '../../src/domain/robot'

RSpec.describe Robot do
  include CustomExceptions

  let(:position) { Position.new(2, 2) }
  let(:direction) { 'EAST' }
  let(:robot) { described_class.new }

  describe '#direction' do
    context 'when invalid' do
      it 'throws a DirectionInvalidError error' do
        expect { robot.direction = 'INVALID' }.to(
          raise_error(CustomExceptions::DirectionInvalidError)
        )
      end
    end

    context 'when valid' do
      it 'assigns the robot new direction' do
        robot.direction = direction
        expect(robot.direction).to eq(direction)
      end
    end
  end

  describe '#current_position' do
    before do
      robot.direction = 'EAST'
      robot.position = Position.new(4, 1)
    end

    it { expect(robot.current_position).to eq '4,1,EAST' }
  end

  describe '#placed?' do
    context 'when the robot has been placed' do
      it 'returns true' do
        robot.direction = direction
        robot.position = position
        expect(robot.placed?).to be true
      end
    end

    context 'when the robot has not been placed' do
      it 'returns true' do
        robot.position = nil
        expect(robot.placed?).to be false
      end
    end
  end
end
