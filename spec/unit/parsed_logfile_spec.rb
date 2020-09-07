# frozen_string_literal: true

RSpec.describe Analyzer::ParsedLogfile do
  subject { described_class.new file_path }

  describe '#call' do
    context 'when there is no file in provided file_path' do
      let(:file_path) { 'spec/fixtures/missing_file.log' }

      it 'raise error' do
        expect { subject }.to raise_error(Analyzer::ParsedLogfile::NoFileError)
      end
    end

    context 'when there is file in provided file_path' do
      let(:file_path) { 'spec/fixtures/test.log' }

      it 'reads file and does not raise error' do
        expect(File).to receive(:open).with(file_path, 'r').and_call_original
        expect { subject }.not_to raise_error
      end

      it 'sends grouped data to Url' do
        expect(Analyzer::Url).to receive(:new).exactly(3).times.and_call_original

        subject
      end
    end
  end

  describe '#ordered_by_occurances' do
    let(:file_path) { 'spec/fixtures/test.log' }

    it 'returns properly ordered collection of urls' do
      expect(subject.ordered_by_occurances.map { |url| url[:name] }).to eq ['/about/2', '/contact', '/home']
      expect(subject.ordered_by_occurances.map { |url| url[:occurences_count] }).to eq [4, 3, 1]
    end
  end

  describe '#ordered_by_uniq_occurances' do
    let(:file_path) { 'spec/fixtures/test.log' }

    it 'returns properly ordered collection of urls' do
      expect(subject.ordered_by_uniq_occurances.map { |url| url[:name] }).to eq ['/contact', '/about/2', '/home']
      expect(subject.ordered_by_uniq_occurances.map { |url| url[:occurences_count] }).to eq [3, 2, 1]
    end
  end
end
