class New < ActiveRecord::Migration
  def change
  	create_table "Games", force: :cascade do |t|
  		t.integer "rounds"
  	end

  	create_table "GamePlayers", force: :cascade do |t|
  		t.belongs_to :game
  		t.string "player_name"
  	end

  	add_reference :users, :game
  end
end
