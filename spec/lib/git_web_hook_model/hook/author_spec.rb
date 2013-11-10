require 'spec_helper'

describe GitWebHookModel::Hook::Author do
  let(:instance) { described_class.new(author) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  let(:commits) { hash.fetch('commits') }
  let(:commit) { commits.first }

  let(:author) { commit.fetch('author') }

  describe '#name' do
    subject { instance.name }

    it 'returns value' do
      expect(subject).to eq("Chuck J hardy")
    end
  end

  describe '#email' do
    subject { instance.email }

    it 'returns value' do
      expect(subject).to eq("chuckjhardy@gmail.com")
    end
  end

  describe '#username' do
    subject { instance.username }

    it 'returns value' do
      expect(subject).to eq("charles-hardy")
    end
  end
end
