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

  describe '#url' do
    subject { instance.url }

    let(:url) do
      %Q{https://github.company.com/organisation/otb_www_app}
    end

    it 'returns value' do
      expect(subject).to eq(url)
    end
  end

  describe '#description' do
    subject { instance.description }

    it 'returns value' do
      expect(subject).to eq('Frontend Application')
    end
  end

  describe '#homepage' do
    subject { instance.homepage }

    it 'returns value' do
      expect(subject).to eq('www.example.co.uk')
    end
  end

  describe '#watchers' do
    subject { instance.watchers }

    it 'returns value' do
      expect(subject).to eq(1)
    end
  end

  describe '#stargazers' do
    subject { instance.stargazers }

    it 'returns value' do
      expect(subject).to eq(1)
    end
  end

  describe '#forks' do
    subject { instance.forks }

    it 'returns value' do
      expect(subject).to eq(0)
    end
  end

  describe '#fork?' do
    subject { instance.fork? }

    it 'returns false' do
      expect(subject).to be_false
    end
  end

  describe '#size' do
    subject { instance.size }

    it 'returns value' do
      expect(subject).to eq(54414)
    end
  end

  describe '#private?' do
    subject { instance.private? }

    it 'returns false' do
      expect(subject).to be_false
    end
  end

  describe '#open_issues' do
    subject { instance.open_issues }

    it 'returns value' do
      expect(subject).to eq(6)
    end
  end

  describe '#has_issues?' do
    subject { instance.has_issues? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#has_downloads?' do
    subject { instance.has_downloads? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#has_wiki?' do
    subject { instance.has_wiki? }

    it 'returns true' do
      expect(subject).to be_true
    end
  end

  describe '#language' do
    subject { instance.language }

    it 'returns value' do
      expect(subject).to eq('Ruby')
    end
  end

  describe '#created_at' do
    subject { instance.created_at }

    it 'returns value' do
      expect(subject).to eq(1295946304)
    end
  end

  describe '#pushed_at' do
    subject { instance.pushed_at }

    it 'returns value' do
      expect(subject).to eq(1383924957)
    end
  end

  describe '#master_branch' do
    subject { instance.master_branch }

    it 'returns value' do
      expect(subject).to eq('master')
    end
  end

  describe '#organization' do
    subject { instance.organization }

    it 'returns value' do
      expect(subject).to eq('organisation')
    end
  end

  describe '#owner' do
    subject { instance.owner }

    it 'returns a owner object' do
      expect(subject).to be_an_instance_of(GitWebHookModel::Hook::Owner)
    end
  end
end
