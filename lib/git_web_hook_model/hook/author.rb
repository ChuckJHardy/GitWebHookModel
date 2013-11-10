class GitWebHookModel
  module Hook
    class Author
      include Id::Model

      field :name
      field :email
      field :username
    end
  end
end
