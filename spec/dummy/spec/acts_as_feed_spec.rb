require 'spec_helper'

describe ActsAsFeed do

	before do
		@fruit = Fruit.create(:name => 'Apple', :updated_at => Time.now)
		ActsAsFeed::Feed.delete_all
	end

	it 'should rebuild feed items' do
		expect {
			ActsAsFeed.rebuild_feeds!
		}.to change(ActsAsFeed::Feed, :count).by(1)
	end

end