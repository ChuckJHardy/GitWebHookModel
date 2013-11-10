[![Build Status](https://travis-ci.org/ChuckJHardy/GitWebHookModel.png?branch=master)](https://travis-ci.org/ChuckJHardy/GitWebHookModel) [![Coverage Status](https://coveralls.io/repos/ChuckJHardy/GitWebHookModel/badge.png)](https://coveralls.io/r/ChuckJHardy/GitWebHookModel) [![Code Climate](https://codeclimate.com/github/ChuckJHardy/GitWebHookModel.png)](https://codeclimate.com/github/ChuckJHardy/GitWebHookModel) [![Gem Version](https://badge.fury.io/rb/git_web_hook_model.png)](http://badge.fury.io/rb/git_web_hook_model)

# GitWebHookModel

Simple, immutable model for github webhooks.

## Installation

Add this line to your application's Gemfile:

    gem 'git_web_hook_model', '~> 0.0.1', group :development

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_web_hook_model
    

## Usage

GitWebHookModel accepts either a hash object or json string returned from [Github's WebHook service](https://help.github.com/articles/post-receive-hooks) and returns an immutable model object.

    model = GitWebHookModel.for(github_json_response)
    # => #<GitWebHookModel::Hook::Model:0x007fba946a8c08>

    model.ref
    # => "refs/heads/feature/ci"

    model.after
    # => "38209a615b72728ef4f3160619c7c63c37b8994c"

    model.before
    # => "0000000000000000000000000000000000000000"

    model.created?
    # => true

    model.deleted?
    # => false

    model.forced?
    # => true

    model.compare
    # => "https://github.company.com/organization/otb_www_app/commit/38209a615b72"
    
Commits `Array` of `GitWebHookModel::Hook::Commit`

	mode.commits
	# => [#<GitWebHookModel::Hook::Commit:0x007fba94714200>]
    
Head Commit `GitWebHookModel::Hook::Commit`

	mode.head_commit
	# => #<GitWebHookModel::Hook::Commit:0x007fba94714200>
	
Pusher `GitWebHookModel::Hook::Owner`

	mode.pusher
	# => #<GitWebHookModel::Hook::Owner:0x007fba94714200>
	
Repository `GitWebHookModel::Hook::Repository`
	
    model.repository.id
    # => 72

    model.repository.name
    # => "otb_www_app"

    model.repository.url
    # => "https://github.company.com/organization/otb_www_app"

    model.repository.description
    # => "Frontend Application"

    model.repository.homepage
    # => "www.example.co.uk"

    model.repository.watchers
    # => 1

    model.repository.stargazers
    # => 1

    model.repository.forks
    # => 0

    model.repository.fork?
    # => false

    model.repository.size
    # => 54414

    model.repository.owner
    # => #<GitWebHookModel::Hook::Owner:0x007fba9483d028>

    model.repository.private?
    # => false

    model.repository.open_issues
    # => 6

    model.repository.has_issues?
    # => true

    model.repository.has_downloads?
    # => true

    model.repository.has_wiki?
    # => true

    model.repository.language
    # => "Ruby"

    model.repository.created_at
    # => 1295946304

    model.repository.pushed_at
    # => 1383924957

    model.repository.master_branch
    # => "master"

    model.repository.organization
    # => "organization"
	
Commit Object `GitWebHookModel::Hook::Commit`

    obj.id
    # => "38209a615b72728ef4f3160619c7c63c37b8994c"

    obj.distinct?
    # => true

    obj.message
    # => "Setup CI"

    obj.timestamp 
    # => 2013-11-08T15:34:33+00:00

    obj.url
    # => "https://github.company.com/organization/otb_www_app/commit/38209a615b72728ef4f3160619c7c63c37b8994c"

    obj.author
    # => #<GitWebHookModel::Hook::Owner:0x007fba946f50a8>

    obj.committer
    # => #<GitWebHookModel::Hook::Owner:0x007fba946f50a8>

    obj.added
    # => [ "continuus_lenimentus.enc" ]

    obj.removed
    # => []

    obj.modified
    # => [ ".simplecov", "Gemfile", "Gemfile.lock", "spec/spec_helper_lite.rb" ]

Owner Object `GitWebHookModel::Hook::Owner`

    obj.name
    # => "Chuck J hardy"

    obj.email
    # => Some["chuckjhardy@gmail.com"] / None

    obj.username
    # => Some["charles-hardy"] / None
    
Sometimes fields are returned from Github as `nil`. In these cases the objects return either `Some[value]` or `None`. Have a look at the [Optional Gem](https://github.com/rsslldnphy/optional) for more information.

## Requirements

* ruby > 1.9.x
* id > 0.1.x

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
