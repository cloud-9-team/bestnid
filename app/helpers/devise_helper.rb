module DeviseHelper
	def devise_error_messages!
	    html = generate_html_error(resource)
	    if html.blank?
	    	return ""
	    end
	    
	    resource.errors.clear

    	flash.now[:alert] = html
	end
end