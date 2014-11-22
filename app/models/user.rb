class User < ActiveRecord::Base
  include ActiveModel::Validations
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    validates :country, :province, :city, :domicile, presence: true

    has_many :products, dependent: :destroy
    has_many :questions
    has_many :bids, dependent: :destroy
end
