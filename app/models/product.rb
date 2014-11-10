class Product < ActiveRecord::Base
	has_one :category
	belongs_to :user
	has_many :questions, dependent: :destroy
	has_many :bids, dependent: :destroy
end