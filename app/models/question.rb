class Question < ActiveRecord::Base
	has_one :answer, dependent: :destroy
	belongs_to :product
	belongs_to :user
end
