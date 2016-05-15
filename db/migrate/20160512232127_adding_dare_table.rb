class AddingDareTable < ActiveRecord::Migration
  def change
  	create_table "Dares", force: :cascade do |t|
  		t.string "request"
  		t.boolean "mature"
  	end
  end
end
