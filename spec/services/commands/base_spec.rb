# frozen_string_literal: true

require_relative '../../../src/services/commands/base'
require_relative '../../../src/util/custom_exceptions'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::Base do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  subject { described_class.new(table, robot) }

  describe '#call' do
    it 'raises NotImplementedError' do
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end

  describe '#position_within_bounds?' do
    it 'returns true when position is within bounds' do
      position = double('Position')
      allow(table).to receive(:position_within_bounds?).with(position).and_return(true)
      expect(subject.position_within_bounds?(position)).to be true
    end

    it 'returns false when position is nil' do
      expect(subject.position_within_bounds?(nil)).to be false
    end

    it 'returns false when position is outside bounds' do
      position = double('Position')
      allow(table).to receive(:position_within_bounds?).with(position).and_return(false)
      expect(subject.position_within_bounds?(position)).to be false
    end
  end
end
