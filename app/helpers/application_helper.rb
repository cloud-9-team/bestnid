module ApplicationHelper
	def timeleft(t)
		t = t.in_time_zone('Buenos Aires')
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

    # Genera el código HTML de los errores en el recurso especificado en el argumento.
    def generate_html_error(resource)
    	# resource.errors es del tipo ActiveModel::Errors
    	return "" if resource.errors.empty?

    	messages = []
    	model_str = resource.class.model_name.to_s.downcase
    	resource.errors.each do |attribute, error|
  			messages << content_tag(:li, 
  				link_to(resource.class.human_attribute_name(attribute), 
  					"#%s_%s" % [model_str, attribute.to_s]) +
				" " + error)
		end
		messages = messages.join

		# errors.messages.not_saved se encuentra en devise.es.yml
    	sentence = I18n.t("errors.messages.not_saved",
                      	count: resource.errors.count,
                     	resource: resource.class.model_name.human.downcase)
    	html = <<-HTML
	    <div id="error_explanation">
	      <h4>#{sentence}</h4>
	      <ul>#{messages}</ul>
	    </div>
	    HTML

		return html.html_safe
	end
end
