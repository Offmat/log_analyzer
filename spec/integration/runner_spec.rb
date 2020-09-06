# frozen_string_literal: true

RSpec.describe Analyzer::Runner do
  subject { described_class.new file_path }

  describe '#call' do
    context 'when valid path is provided' do
      let(:file_path) { 'spec/fixtures/test.log' }

      let(:expected_result) do
        "Most viewed urls:\n" \
        "/about/2 -> 4\n" \
        "/contact -> 3\n" \
        "/home -> 1\n" \
        "\n" \
        "Most (uniquely) viewed urls:\n" \
        "/contact -> 3\n" \
        "/about/2 -> 2\n" \
        "/home -> 1\n" \
      end

      it 'prints proper results' do
        expect { subject.call }.to output(expected_result).to_stdout
      end
    end
  end
end
