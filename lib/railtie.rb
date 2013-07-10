require 'acts_as_feed'
require 'rails'
module ActsAsFeed
  class Railtie < Rails::Railtie
    railtie_name :acts_as_feed

    rake_tasks do
      load "tasks/acts_as_feed_tasks.rake"
    end
  end
end