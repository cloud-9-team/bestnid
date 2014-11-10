class AddProductRefToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :product, index: true
  end
end
