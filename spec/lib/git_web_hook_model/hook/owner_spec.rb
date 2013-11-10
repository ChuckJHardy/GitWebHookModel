require 'spec_helper'

describe GitWebHookModel::Hook::Owner do
  let(:instance) { described_class.new(owner) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  let(:repository) { hash.fetch('repository') }
  let(:owner) { repository.fetch('owner') }

  describe '#name' do
    subject { instance.name }

    it 'returns value' do
      expect(subject).to eq("company")
    end
  end

  describe '#email' do
    subject { instance.email }

    it 'returns none' do
      expect(subject).to eq(None)
    end
  end

  describe '#username' do
    subject { instance.username }

    it 'returns none' do
      expect(subject).to eq(None)
    end
  end
end
