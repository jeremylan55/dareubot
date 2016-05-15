class DeletingTableGamePlayer < ActiveRecord::Migration
  def change
  	drop_table :GamePlayers
  end
end
