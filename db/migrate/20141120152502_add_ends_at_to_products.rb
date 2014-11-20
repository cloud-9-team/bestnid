class AddEndsAtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ends_at, :datetime
  end
end
