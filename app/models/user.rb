class User < ActiveRecord::Base
  include ActiveModel::Validations
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    validates :country, :province, :city, :domicile, :first_name, :email, :last_name, :allow_blank => false, :allow_nil => false, :on => :create, presence: true
    validates :card_owner_first_name, :card_owner_last_name, :allow_blank => false, :allow_nil => false, :on => :create, presence: true
    validates :security_code, :allow_blank => false, :length => { :minimum => 3, :maximum => 3 }
    validates :card_1, :card_2, :card_3, :card_4, :allow_blank => false, :length => { :minimum => 4, :maximum => 4 }

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
