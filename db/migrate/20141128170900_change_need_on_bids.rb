class ChangeNeedOnBids < ActiveRecord::Migration
  def change
	change_column :bids, :need, :text, :limit => nil
  end
end
