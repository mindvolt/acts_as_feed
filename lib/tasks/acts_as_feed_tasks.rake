# desc "Explaining what the task does"
# task :acts_as_feed do
#   # Task goes here
# end
namespace :acts_as_feed do
	desc "(Re)build feed items"
	task :rebuild => :environment do
	  ActsAsFeed.rebuild_feeds!
	end
end