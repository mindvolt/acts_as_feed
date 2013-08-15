class Vegetable < ActiveRecord::Base

	attr_accessible :name, :created_at, :updated_at
	acts_as_feed

	def create_feedable?
		false
	end

end