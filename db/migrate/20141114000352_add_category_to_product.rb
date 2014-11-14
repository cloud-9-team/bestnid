class AddCategoryToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :category_name, :string
  end
end
