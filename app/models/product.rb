class Product < ActiveRecord::Base
  include ActiveModel::Validations
	belongs_to :category
	belongs_to :user
	belongs_to :chosen_bid, class_name: "Bid", foreign_key: "chosen_bid_id"
	has_many :questions, dependent: :destroy
	has_many :bids, dependent: :destroy


	scope :by_title, -> sentido { order(title: (((sentido.present?) and (sentido.downcase == "asc")) ? :asc : :desc))}
	scope :by_created_at, -> sentido { order(created_at: (((sentido.present?) and (sentido.downcase == "asc")) ? :asc : :desc))}
	scope :by_ends_at, -> sentido { order(ends_at: (((sentido.present?) and (sentido.downcase == "asc")) ? :asc : :desc))}

	scope :active_only, -> { where("products.ends_at > ?", Time.now) }
	scope :finished_only, -> { where("products.ends_at < ? and products.chosen_bid_id is not NULL", Time.now) }

	validates :title, :description, :allow_blank => false, :allow_nil => false, :on => :create, presence: true
	#validates :imageURL, :allow_blank => false, :allow_nil => false, :on => :create, presence: true

	def self.search(query)
		consulta1 = where('products.title ilike ? or products.description ilike ?', "%#{query}%", "%#{query}%")
		consulta2 = joins(:category).where("categories.name ilike ?", "%#{query}%")
		arr = consulta1 | consulta2 # Devuelve la unión de los dos conjuntos, pero es un arreglo, NO ES UNA ActiveRecord Relation
		return where(id: arr.map(&:id)) #Conversión a AR Relation... no es lo mejor pero así permite usar scopes
	end

	def self.greater_than(column, date)
		where("? > ?", column, date)
	end

	def self.less_than(column, date)
		where("? > ?", column, date)
	end

	# Permite obtener los productos cuyo valor en la columna especificada en column se
	# encuentre entre td1 y td2. Tener en cuenta que el orden de éstos importa, por lo
	# general, td1 debe ser mayor, en el sentido del tipo de datos, que td2, por ejemplo
	# si se desea buscar entre dos DateTimes, td1 debe ser anterior a td2.
	def self.between(column, td1, td2)
		where("#{column} BETWEEN ? AND ?", td1, td2)
	end

	# Permite saber si ya ha transcurrido el tiempo de la subasta.
	# No indica nada si se ha escogido una oferta o no, sólo hace la comprobación de que el
	# momento actual sea más tardío que el momento especificado para el final de la subasta,
	# si es así, entonces este método devolverá true, de lo contrario false.
	def timeout?
		return Time.now > ends_at
	end

	# Permite saber si la subasta ha finalizado completamente, es decir que si ha transcurrido
	# el tiempo de la subasta y se ha escogido una de todas las ofertas que se le han hecho al
	# producto.
	# Devuelve true si la subasta terminó, en cualquier otro caso false.
	def finished?
		if timeout? and chosen_bid.present?
			return true
		else
			return false
		end
	end

	# Permite obtener las preguntas que actualmente no tienen una respuesta asociada.
	# El tipo devuelto es una ActiveRecord::Relation por lo cual es encadenable con
	# otras consultas de la misma índole, por ejemplo métodos de ActiveRecord::QueryMethods.
	def not_answered_questions
		questions.includes(:answer).where(answers: {id: nil}).references(:answer)
	end

end
