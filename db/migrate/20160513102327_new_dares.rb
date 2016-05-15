class NewDares < ActiveRecord::Migration
  def change
   	create_table "Actions", force: :cascade do |t|
   		t.string "type"
   		t.string "category"
  		t.string "request"
  		t.integer "points"
  	end
  end
end
