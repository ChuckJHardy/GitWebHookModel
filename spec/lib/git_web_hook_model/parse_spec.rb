require 'spec_helper'

describe GitWebHookModel::Parse do
  let(:instance) { described_class.new(response) }
  let(:response) { File.read('spec/fixtures/hook.json') }

  describe '#as_hash' do
    subject { instance.as_hash }

    it 'returns an instance of hash' do
      expect(subject).to be_an_instance_of(Hash)
    end

    context 'given a hash' do
      let(:response) { {} }

      it 'returns original hash' do
        expect(subject).to eq(response)
      end
    end

    context 'given json' do
      it 'returns parsed json as a hash' do
        expect(subject).to eq(JSON.parse(response))
      end
    end
  end
end
