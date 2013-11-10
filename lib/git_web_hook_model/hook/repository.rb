class GitWebHookModel
  module Hook
    class Repository
      include Id::Model

      field :id
      field :name
      field :url
      field :description
      field :homepage
      field :watchers
      field :stargazers
      field :forks
      field :fork
      field :size
      field :private
      field :open_issues
      field :has_issues
      field :has_downloads
      field :has_wiki
      field :language
      field :created_at
      field :pushed_at
      field :master_branch
      field :organization

      has_one :owner
    end
  end
end
