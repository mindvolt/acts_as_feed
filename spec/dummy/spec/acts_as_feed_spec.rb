require 'spec_helper'

describe ActsAsFeed do

	before do
		@fruit = Fruit.create(:name => 'Apple', :updated_at => Time.now)
		ActsAsFeed::Feed.delete_all
	end

	it 'should create feed items' do
		expect {
			Fruit.create(:name => 'Apple', :updated_at => Time.now)
		}.to change(ActsAsFeed::Feed, :count).by(1)
	end

	it 'should rebuild feed items' do
		expect {
			ActsAsFeed.rebuild_feeds!
		}.to change(ActsAsFeed::Feed, :count).by(1)
	end

	it 'should not create duplicates' do
		expect {
			@fruit.update_attributes({:updated_at => Time.now})
		}.to change(ActsAsFeed::Feed, :count).by(1)
		expect {
			@fruit.update_attributes({:updated_at => Time.now})
		}.not_to change(ActsAsFeed::Feed, :count)
	end

	it 'should not create a feed if create_feedable? returns false' do
		expect {
			@vegetable = Vegetable.create(:name => 'Broccoli', :updated_at => Time.now)
		}.not_to change(ActsAsFeed::Feed, :count)
	end

end