class CompleteUsers < ActiveRecord::Migration
  def change
  	add_column :users, :domicile, :string
  	add_column :users, :card_1, :string
  	add_column :users, :card_2, :string
  	add_column :users, :card_3, :string
  	add_column :users, :card_4, :string
  end
end
