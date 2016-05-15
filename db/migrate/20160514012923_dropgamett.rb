class Dropgamett < ActiveRecord::Migration
  def change
  	drop_table :Games
  end
end
