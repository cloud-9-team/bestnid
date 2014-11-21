class AddChosenBidRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :chosen_bid, index: true
  end
end
