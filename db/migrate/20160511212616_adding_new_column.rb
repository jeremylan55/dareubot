class AddingNewColumn < ActiveRecord::Migration
  def change
  	add_column :users, :AddingPlayer, :bool
  end
end
