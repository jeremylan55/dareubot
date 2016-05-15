class NewPlayers < ActiveRecord::Migration
  def change
  	create_table "Players", force: :cascade do |t|
  		t.belongs_to :game
  		t.string "player_name"
  		t.integer "points"
  	end
  end
end
