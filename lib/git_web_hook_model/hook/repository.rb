class GitWebHookModel
  module Hook
    class Repository
      include Id::Model

      field :id
      field :name
    end
  end
end
