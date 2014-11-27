class Bid < ActiveRecord::Base
  include ActiveModel::Validations
	belongs_to :product
	belongs_to :user

	validates :need, :allow_blank => false, :allow_nil => false, :on => :create, presence: true
	validates :value, presence: true
end
