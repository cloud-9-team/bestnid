class AddFinalizadoToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :finished, :boolean
  end
end
