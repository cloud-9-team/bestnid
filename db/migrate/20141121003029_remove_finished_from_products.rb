class RemoveFinishedFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :finished, :boolean
  end
end
