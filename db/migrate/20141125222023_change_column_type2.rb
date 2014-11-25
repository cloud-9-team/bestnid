class ChangeColumnType2 < ActiveRecord::Migration
  def change
  	add_column :users, :expires_on, :date
  end
end
