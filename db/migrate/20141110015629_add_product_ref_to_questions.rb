class AddProductRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :product, index: true
  end
end
