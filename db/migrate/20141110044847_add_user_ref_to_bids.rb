class AddUserRefToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :user, index: true
  end
end
