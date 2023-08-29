# frozen_string_literal: true

require_relative '../../src/domain/position'
require_relative '../../src/domain/table'

RSpec.describe Table do
  let(:width) { 5 }
  let(:height) { 5 }
  let(:table) { Table.new(width, height) }

  describe '#position_within_bounds?' do
    context 'when position is within bounds' do
      let(:position) { Position.new(width - 1, height - 1) }
      it 'returns true' do
        expect(table.position_within_bounds?(position)).to be true
      end
    end

    context 'when position is out of bounds' do
      let(:position) { Position.new(width + 1, height + 1) }

      it 'returns false' do
        expect(table.position_within_bounds?(position)).to be false
      end
    end
  end
end
