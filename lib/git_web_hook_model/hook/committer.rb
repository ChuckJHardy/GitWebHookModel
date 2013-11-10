class GitWebHookModel
  module Hook
    class Committer
      include Id::Model

      field :name
      field :email
      field :username
    end
  end
end
