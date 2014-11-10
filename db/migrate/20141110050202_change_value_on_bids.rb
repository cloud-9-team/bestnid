class ChangeValueOnBids < ActiveRecord::Migration
  def change
  	change_column :bids, :value, :float
  end
end
