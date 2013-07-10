require 'spec_helper'

describe Fruit do

	it 'Should act as feed' do
		fruit = Fruit.create(:name => 'Apple')
		fruit.respond_to?(:ensure_feedable).should be_true
	end

end