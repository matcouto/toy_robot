# frozen_string_literal: true

require 'spec_helper'
require_relative '../position'

RSpec.describe Position do
  describe '#current_position' do
    it 'returns the current position of the robot' do
      expect(described_class.new(3, 0).current_position).to eq([3, 0])
    end
  end
end
