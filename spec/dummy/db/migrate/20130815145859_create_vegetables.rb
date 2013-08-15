class CreateVegetables < ActiveRecord::Migration
  def change
  	create_table :vegetables do |t|
  		t.string :name
  		t.timestamps
  	end
  end
end
