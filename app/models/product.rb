class Product < ActiveRecord::Base
	has_one :category
	belongs_to :user
	has_many :questions, dependent: :destroy
	has_many :bids, dependent: :destroy

	default_scope -> { order(created_at: :asc) }
	
	searchable do
    	text :title, :boost => 2
     	text :description
	end

end
