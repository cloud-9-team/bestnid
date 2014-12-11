class AddFinishedAtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :finished_at, :datetime
  end
end
