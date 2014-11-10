class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :imageURL
      t.string :description
      t.integer :visitCount
      t.integer :totalDays

      t.timestamps
    end
  end
end
