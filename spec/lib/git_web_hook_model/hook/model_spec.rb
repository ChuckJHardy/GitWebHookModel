require 'spec_helper'

describe GitWebHookModel::Hook::Model do
  let(:instance) { described_class.new(hash) }

  let(:response) { File.read('spec/fixtures/hook.json') }
  let(:hash) { GitWebHookModel::Parse.new(response).as_hash }

  describe '#ref' do
    subject { instance.ref }

    it 'returns value' do
      expect(subject).to eq("refs/heads/feature/ci")
    end
  end

  describe '#after' do
    subject { instance.after }

    it 'returns value' do
      expect(subject).to eq("38209a615b72728ef4f3160619c7c63c37b8994c")
    end
  end

  describe '#before' do
    subject { instance.before }

    it 'returns value' do
      expect(subject).to eq("0000000000000000000000000000000000000000")
    end
  end

  describe '#created?' do
    subject { instance.created? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#deleted?' do
    subject { instance.deleted? }

    it 'returns false' do
      expect(subject).to be_false
    end
  end

  describe '#forced?' do
    subject { instance.forced? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#compare' do
    subject { instance.compare }

    let(:url) do
      %Q{https://github.company.com/organisation/otb_www_app/commit/38209a615b72}
    end

    it 'returns value' do
      expect(subject).to eq(url)
    end
  end

  describe '#commits' do
    subject { instance.commits }

    context 'returns a collection' do
      it 'as an array' do
        expect(subject).to be_an_instance_of(Array)
      end

      it 'of commit objects' do
        expect(subject.first).to be_an_instance_of(GitWebHookModel::Hook::Commit)
      end
    end
  end

  describe '#head_commit' do
    subject { instance.head_commit }

    it 'of commit objects' do
      expect(subject).to be_an_instance_of(GitWebHookModel::Hook::Commit)
    end
  end

  describe '#repository' do
    subject { instance.repository }

    it 'of repository objects' do
      expect(subject).to be_an_instance_of(GitWebHookModel::Hook::Repository)
    end
  end
end
