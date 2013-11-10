require 'spec_helper'

describe GitWebHookModel::Hook::Committer do
  let(:instance) { described_class.new(committer) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  let(:commits) { hash.fetch('commits') }
  let(:commit) { commits.first }

  let(:committer) { commit.fetch('committer') }

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
