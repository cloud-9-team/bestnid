class RemoveVisitCountFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :visitCount, :integer
  end
end
