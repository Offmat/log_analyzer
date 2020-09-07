# frozen_string_literal: true

RSpec.describe Analyzer::Url do
  subject { described_class.new(name) }

  let(:name) { '/home/test' }

  describe '#name' do
    it 'returns proper name' do
      expect(subject.name).to eq '/home/test'
    end
  end

  describe '#new_occurence' do
    context 'when ocurrnce is new ip' do
      it 'adds it to occurences counter and uniq occurences' do
        expect { subject.new_occurence('1.1.1.1') }.to change { subject.occurences_count }.from(0).to(1)
          .and change { subject.uniq_occurences_count }.from(0).to(1)
      end
    end

    context 'when ocurrnce is duplicated' do
      before { subject.new_occurence('1.1.1.1') }

      it 'adds it to occurences counter' do
        expect { subject.new_occurence('1.1.1.1') }.to change { subject.occurences_count }.from(1).to(2)
      end

      it 'does not add it to uniq occurences' do
        expect { subject.new_occurence('1.1.1.1') }.not_to(change { subject.uniq_occurences_count })
      end
    end
  end
end
