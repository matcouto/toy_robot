# frozen_string_literal: true

require 'spec_helper'
require_relative '../robot'

RSpec.describe Robot do
  let(:robot) { described_class.new }
  let(:position) { Position.new(2, 2) }

  describe '#move' do
    context 'when direction is NORTH' do
      it 'returns the new position of the robot' do
        expect(robot.move(position, 'NORTH')).to eq([0, 1])
      end
    end
  end
end
