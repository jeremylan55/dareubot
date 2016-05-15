class NewColUser < ActiveRecord::Migration
  def change
  	add_column :users, :gamestarted, :bool
  end
end
