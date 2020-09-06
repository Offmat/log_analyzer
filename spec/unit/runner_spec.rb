# frozen_string_literal: true

RSpec.describe Analyzer::Runner do
  subject { described_class.new file_path }

  describe '#call' do
    context 'when valid path is not provided' do
      context 'when path is empty string' do
        let(:file_path) { '' }

        it 'returns error information' do
          expect { subject.call }.to output("File path is missing\n").to_stdout
        end
      end

      context 'when path is not provided' do
        let(:file_path) { nil }

        it 'returns error information' do
          expect { subject.call }.to output("File path is missing\n").to_stdout
        end
      end
    end

    context 'when valid path is provided' do
      let(:file_path) { 'spec/fixtures/test.log' }

      it 'calls file parser' do
        expect(Analyzer::ParsedLogfile).to receive(:new).with(file_path).and_call_original

        subject.call
      end
    end
  end
end
