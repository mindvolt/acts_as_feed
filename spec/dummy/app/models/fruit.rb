class Fruit < ActiveRecord::Base

	attr_accessible :name, :created_at, :updated_at
	acts_as_feed

end