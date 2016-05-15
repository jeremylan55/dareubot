class Addpts < ActiveRecord::Migration
  def change
  	create_table "Games", force: :cascade do |t|
  		t.integer "rounds"
  		t.boolean "started"
  		t.boolean "addingplayers"
  		t.string "category"
  		t.string "lastplayer"
  		t.integer "lastpoint"
  	end
  end
end
