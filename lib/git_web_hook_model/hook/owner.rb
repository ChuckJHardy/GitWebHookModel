require 'optional'

class GitWebHookModel
  module Hook
    class Owner
      include Id::Model

      field :name
      field :email, optional: true
    end
  end
end
