class ChangeColumnType < ActiveRecord::Migration
  def change
  	remove_column :users, :expires_on, :string
  end
end
