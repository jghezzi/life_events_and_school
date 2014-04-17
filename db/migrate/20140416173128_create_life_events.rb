class CreateLifeEvents < ActiveRecord::Migration
  def change
  	create_table :life_events do |t|
  		t.string :event_name
  		t.datetime :event_date
  	end
  end
end