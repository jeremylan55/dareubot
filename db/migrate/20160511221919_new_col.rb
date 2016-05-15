class NewCol < ActiveRecord::Migration
  def change
  	add_column :games, :started, :bool
  end
end
