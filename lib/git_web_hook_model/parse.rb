require 'json'

class GitWebHookModel
  class Parse
    def initialize(response)
      @response = response
    end

    def as_hash
      hash? ? @response : parsed_response
    end

    private

    def hash?
      @response.is_a?(Hash)
    end

    def parsed_response
      JSON.parse(@response)
    end
  end
end
