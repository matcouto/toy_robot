# frozen_string_literal: true

require_relative '../../../src/services/commands/processor_factory'
require_relative '../../../src/domain/table'
require_relative '../../../src/domain/robot'

describe Commands::ProcessorFactory do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }
  let(:processor_factory) { described_class.new(table, robot) }

  describe '#create_processor' do
    context 'when given a valid command' do
      it 'returns an instance of the corresponding command class' do
        command = 'PLACE'
        processor = processor_factory.create_processor(command)
        expect(processor).to be_an_instance_of(Commands::Place)
      end
    end

    context 'when given an invalid command' do
      it 'raises CommandInvalidError' do
        command = 'INVALID'
        expect do
          processor_factory.create_processor(command)
        end.to raise_error(CustomExceptions::CommandInvalidError)
      end
    end
  end
end
