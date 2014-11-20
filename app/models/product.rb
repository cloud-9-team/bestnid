class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :questions, dependent: :destroy
	has_many :bids, dependent: :destroy


	scope :by_title, -> sentido { order(title: (((sentido.present?) and (sentido.downcase == "asc")) ? :asc : :desc))}
	scope :by_created_at, -> sentido { order(created_at: (((sentido.present?) and (sentido.downcase == "asc")) ? :asc : :desc))}
	#No funciona actualmente, necesidad de columna ends_at para mucha más facilidad. Analizar eliminación de totalDays
	scope :by_ends_at, -> sentido { order("created_at " + (((sentido.present?) and (sentido.downcase == "asc")) ? "asc" : "desc").to_s )}

	
	def self.search(query)
		consulta1 = where('products.title ilike ? or products.description ilike ?', "%#{query}%", "%#{query}%")
		consulta2 = joins(:category).where("categories.name ilike ?", "%#{query}%")
		arr = consulta1 | consulta2 # Devuelve la unión de los dos conjuntos, pero es un arreglo, NO ES UNA ActiveRecord Relation
		return where(id: arr.map(&:id)) #Conversión a AR Relation... no es lo mejor pero así permite usar scopes
	end

end
