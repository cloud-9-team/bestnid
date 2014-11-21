class RemoveTotalDaysFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :totalDays, :integer
  end
end
