class DropgameT < ActiveRecord::Migration
  def change
  	drop_table :Games
  end
end
