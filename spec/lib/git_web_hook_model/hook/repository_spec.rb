require 'spec_helper'

describe GitWebHookModel::Hook::Repository do
  let(:instance) { described_class.new(repository) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  let(:repository) { hash.fetch('repository') }

  describe '#id' do
    subject { instance.id }

    it 'returns value' do
      expect(subject).to eq(72)
    end
  end

  describe '#name' do
    subject { instance.name }

    it 'returns value' do
      expect(subject).to eq('otb_www_app')
    end
  end
end
