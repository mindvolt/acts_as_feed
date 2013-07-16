module ActsAsFeed

  require 'railtie' if defined?(Rails)

	def self.included(base)
		base.send(:extend, ClassMethods)
	end

  def self.rebuild_feeds!
    @classes.each do |klass|
      klass.all.each do |instance|
        instance.acts_as_feed_rebuild!
      end
    end
  end

  def self.models= models
    @classes ||= []
    models.each do |model|
      @classes << model.camelize.constantize
    end
  end

  def self.classes
    @classes
  end

	module ClassMethods

		attr_accessor :acts_as_feed_sync
		attr_accessor :acts_as_feed_on

		def acts_as_feed(options={})
			self.acts_as_feed_sync = options[:sync] || false
			self.acts_as_feed_on = options[:on] || :updated_at
			has_one :feed, :as => :feedable, :class_name => 'ActsAsFeed::Feed'
			validates acts_as_feed_on, :presence => true
			after_save :ensure_feedable
      send(:include, InstanceMethods)
    end

  end

  module InstanceMethods

  	def ensure_feedable
  		if self.class.acts_as_feed_sync === true || self.id_changed?
  			self.acts_as_feed_rebuild!
  		end
  	end

    def acts_as_feed_rebuild!
      self.feed.delete if self.feed
      ActsAsFeed::Feed.create({
        :updated_at => self.send(self.class.acts_as_feed_on),
        :feedable => self
      })
    end

  end

  class Feed < ActiveRecord::Base

  	attr_accessible :updated_at,
  		:created_at,
      :feedable,
  		:feedable_type,
  		:feedable_id

    belongs_to :feedable, :polymorphic => true

  end

end

ActiveRecord::Base.send :include, ActsAsFeed
