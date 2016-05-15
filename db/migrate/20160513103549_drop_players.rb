class DropPlayers < ActiveRecord::Migration
  def change
  	drop_table :Players
  end
end
