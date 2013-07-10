$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_feed"
  s.version     = ActsAsFeed::VERSION
  s.authors     = ["Chris McLeod"]
  s.email       = ["chris@mindvolt.com"]
  s.homepage    = "http://www.mindvolt.com"
  s.summary     = "Allows multiple models to be used as one collection"
  s.description = "Allows multiple models to be used as one collection"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails-dummy"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "awesome_print"
end
