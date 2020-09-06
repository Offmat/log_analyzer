# frozen_string_literal: true

RSpec.describe Analyzer::Url do
  subject { described_class.new(name, occurences) }

  let(:name) { '/home/test' }
  let(:occurences) { ['1.1.1.1', '2.2.2.2', '1.1.1.1', '3.3.3.3'] }

  describe '#name' do
    it 'returns proper name' do
      expect(subject.name).to eq '/home/test'
    end
  end

  describe '#occurences' do
    it 'returns proper occurences' do
      expect(subject.occurences).to match_array ['1.1.1.1', '2.2.2.2', '1.1.1.1', '3.3.3.3']
    end
  end

  describe '#occurences_count' do
    it 'returns proper occurences count' do
      expect(subject.occurences_count).to eq 4
    end
  end

  describe '#uniq_occurences_count' do
    it 'returns proper uniq occurences count' do
      expect(subject.uniq_occurences_count).to eq 3
    end
  end
end
