# desc "Explaining what the task does"
# task :acts_as_feed do
#   # Task goes here
# end
namespace :acts_as_feed
	desc "(Re)build feed items"
	task :rebuild => :environment do
	  Rails.application.eager_load!
	  ActiveRecord::Base.descendants.each do |klass|
	  	if klass.acts_as_feed?
	  		klass.acts_as_feed_rebuild
	  	end
	  end
	end
end