require 'optional'

class GitWebHookModel
  module Hook
    class Owner
      include Id::Model

      field :name
      field :email, optional: true
      field :username, optional: true
    end
  end
end
