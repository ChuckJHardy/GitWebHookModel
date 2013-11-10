class GitWebHookModel
  module Hook
    class Model
      include Id::Model

      field :ref
      field :after
      field :before
      field :created
      field :deleted
      field :forced
      field :compare

      has_many :commits

      has_one :head_commit, type: Commit
      has_one :repository
    end
  end
end
