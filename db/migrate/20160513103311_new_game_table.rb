class NewGameTable < ActiveRecord::Migration
  def change
  	create_table "Games", force: :cascade do |t|
  		t.integer "rounds"
  		t.boolean "started"
  		t.boolean "addingplayers"
  		t.boolean "category"
  	end
  end
end
