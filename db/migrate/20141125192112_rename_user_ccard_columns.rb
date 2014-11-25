class RenameUserCcardColumns < ActiveRecord::Migration
  def change
  	rename_column :users, :card_owner, :card_owner_first_name
  	add_column :users, :card_owner_last_name, :string
  end
end
