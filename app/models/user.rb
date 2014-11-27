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


  	# A partir del código de país se intentará obtener el nombre completo
  	# traducido, en caso de que no se pueda, se obtendrá su nombre en inglés.
  	def country_name
	    c = ISO3166::Country[country]
	    c.translations[I18n.locale.to_s] || c.name
  	end
end
