module ApplicationHelper
	def timeleft(t)
		content_tag :span, localize(t, format: :long_wo_year), title: localize(t, format: :db)
	end

	def image_tag_with_alt(source, options={})
		options[:onerror] = "this.onerror=null; this.src='" + path_to_image("missing.png") + "';"
		image_tag(source, options)
	end

	# Devuelve un arreglo con los nombres de los meses traducidos, con la primera letra en MAYÚSCULA
	# Si use_short_month es true entonces entonces los nombres de los meses se devolverán abreviados,
	# y para cualquier otro valor del parámetro se obtendrán los nombres completos.
	def translated_month_names(use_short_month)
        key = use_short_month ? :'date.abbr_month_names' : :'date.month_names'
        I18n.translate(key).map {|month| month.present? ? month.titleize : nil}
    end
end
