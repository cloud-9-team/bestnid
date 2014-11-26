class AddAdditionalCcardInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :expires_on, :string
  	add_column :users, :security_code, :string
  	add_column :users, :card_owner, :string
  end
end
