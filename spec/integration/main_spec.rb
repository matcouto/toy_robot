# frozen_string_literal: true

require_relative '../../src/toy_robot_game'
require_relative '../../src/domain/table'
require_relative '../../src/domain/robot'

RSpec.describe 'main' do
  let(:script_path) { File.join(__dir__, '../../src', 'main.rb') }
  let(:run_script) { Open3.capture3("ruby #{script_path}", stdin_data: commands.join("\n")) }
  context 'when passing a valid PLACE command' do
    let(:commands) do
      [
        'PLACE 1,2,NORTH',
        'REPORT',
        'exit'
      ]
    end
    it 'places the robot at the given position and direction' do
      stdout, _stderr, _status = run_script
      expect(stdout).to include('1,2,NORTH')
    end
  end

  context 'when passing a valid MOVE command' do
    let(:commands) do
      [
        'PLACE 0,1,NORTH',
        'MOVE',
        'REPORT',
        'exit'
      ]
    end
    it 'moves the robot one position to its current direction' do
      stdout, _stderr, _status = run_script
      expect(stdout).to include('0,2,NORTH')
    end

    context 'when passing a valid LEFT command' do
      let(:commands) do
        [
          'PLACE 0,4,NORTH',
          'LEFT',
          'REPORT',
          'exit'
        ]
      end

      it 'rotates the robot to the next direction anticlockwise' do
        stdout, _stderr, _status = run_script
        expect(stdout).to include('0,4,WEST')
      end
    end

    context 'when passing a valid RIGHT command' do
      let(:commands) do
        [
          'PLACE 0,4,NORTH',
          'RIGHT',
          'REPORT',
          'exit'
        ]
      end
      it 'rotates the robot to the next direction clockwise' do
        stdout, _stderr, _status = run_script
        expect(stdout).to include('0,4,EAST')
      end
    end

    context 'when passing a valid REPORT command' do
      let(:commands) do
        [
          'PLACE 0,4,NORTH',
          'REPORT',
          'exit'
        ]
      end
      it 'reports the current position of the robot' do
        stdout, _stderr, _status = run_script
        expect(stdout).to include('Output: 0,4,NORTH')
      end
    end

    context 'when passing an invalid Direction' do
      let(:commands) do
        [
          'PLACE 0,4,INVALID',
          'REPORT',
          'exit'
        ]
      end

      it 'displays an error message for the invalid direction after the script execution' do
        stdout, _stderr, _status = run_script
        expect(stdout).to include('Invalid direction: INVALID')
      end
    end

    context 'when passing an invalid Command' do
      let(:commands) do
        [
          'INVALID 0,4,NORTH',
          'REPORT',
          'exit'
        ]
      end
      it 'displays an error message for the invalid command after the script execution' do
        stdout, _stderr, _status = run_script
        expect(stdout).to include('Invalid command: INVALID')
      end
    end
  end
end
