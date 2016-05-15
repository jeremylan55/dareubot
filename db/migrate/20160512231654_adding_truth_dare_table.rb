class AddingTruthDareTable < ActiveRecord::Migration
  def change
  	create_table "Truths", force: :cascade do |t|
  		t.string "request"
  		t.boolean "mature"
  	end
  end
end
