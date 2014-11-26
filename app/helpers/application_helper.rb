module ApplicationHelper
	def timeleft(t)
		content_tag :span, localize(t, format: :long_wo_year), title: localize(t, format: :db)
	end

	def image_tag_with_alt(source, options={})
		options[:onerror] = "this.onerror=null; this.src='" + path_to_image("missing.png") + "';"
		image_tag(source, options)
	end
end
