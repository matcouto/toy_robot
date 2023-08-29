# frozen_string_literal: true

require_relative '../../src/domain/position'

RSpec.describe Position do
  describe '#current' do
    it 'returns the current position of the robot' do
      expect(described_class.new(3, 0).current).to eq([3, 0])
    end
  end

  describe '#valid?' do
    context 'when position is invalid' do
      it 'returns false' do
        expect(described_class.new(-1, 0).valid?).to be false
      end
    end

    context 'when position is valid' do
      it 'returns true' do
        expect(described_class.new(0, 0).valid?).to be true
      end
    end
  end
end
