require 'spec_helper'

describe GitWebHookModel::Hook::Commit do
  let(:instance) { described_class.new(commit) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  let(:commits) { hash.fetch('commits') }
  let(:commit) { commits.first }

  describe '#id' do
    subject { instance.id }

    it 'returns value' do
      expect(subject).to eq("38209a615b72728ef4f3160619c7c63c37b8994c")
    end
  end

  describe '#distinct?' do
    subject { instance.distinct? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#message' do
    subject { instance.message }

    it 'returns value' do
      expect(subject).to eq('Setup CI')
    end
  end

  describe '#timestamp' do
    subject { instance.timestamp }

    it 'returns Time object' do
      expect(subject).to be_an_instance_of(Time)
    end
  end

  describe '#url' do
    subject { instance.url }

    let(:url) do
      %Q{https://github.company.com/organisation/otb_www_app/commit/38209a615b72728ef4f3160619c7c63c37b8994c}
    end

    it 'returns value' do
      expect(subject).to eq(url)
    end
  end
  
  describe '#added' do
    subject { instance.added }

    it 'returns collection' do
      expect(subject).to be_an_instance_of(Array)
    end
  end

  describe '#removed' do
    subject { instance.removed }

    it 'returns collection' do
      expect(subject).to be_an_instance_of(Array)
    end
  end

  describe '#modified' do
    subject { instance.modified }

    it 'returns collection' do
      expect(subject).to be_an_instance_of(Array)
    end
  end

  describe '#author' do
    subject { instance.author }

    it 'returns Author object' do
      expect(subject).to be_an_instance_of(GitWebHookModel::Hook::Author)
    end
  end

  describe '#committer' do
    subject { instance.committer }

    it 'returns Author object' do
      expect(subject).to be_an_instance_of(GitWebHookModel::Hook::Committer)
    end
  end
end
