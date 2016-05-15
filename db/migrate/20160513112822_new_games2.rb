class NewGames2 < ActiveRecord::Migration
  def change
  	create_table "Games", force: :cascade do |t|
  		t.integer "rounds"
  		t.boolean "started"
  		t.boolean "addingplayers"
  		t.string "category"
  	end
  end
end
