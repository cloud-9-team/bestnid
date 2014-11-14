class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :questions, dependent: :destroy
	has_many :bids, dependent: :destroy

	default_scope -> { order(created_at: :desc) }
	
	def self.search(query)
		where("title ilike ? or description ilike ?", "%#{query}%", "%#{query}%") | joins(:category).where("name ilike ?", "%#{query}%")
	end

end
