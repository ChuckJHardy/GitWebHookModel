class GitWebHookModel
  module Hook
    class Commit
      include Id::Model
      include Id::Timestamps

      field :id
      field :distinct
      field :message
      field :timestamp, type: Time
      field :url
      field :added
      field :removed
      field :modified

      has_one :author, type: Owner
      has_one :committer, type: Owner
    end
  end
end
