class DropTruthTable < ActiveRecord::Migration
  def change
  	drop_table :Truths
  end
end
