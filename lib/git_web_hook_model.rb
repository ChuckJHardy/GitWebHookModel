require 'id'

require "git_web_hook_model/parse"
require "git_web_hook_model/hook/owner"
require "git_web_hook_model/hook/commit"
require "git_web_hook_model/hook/repository"
require "git_web_hook_model/hook/model"
require "git_web_hook_model/version"

class GitWebHookModel
  def self.for(response)
    Hook::Model.new(Parse.new(response).as_hash)
  end
end
