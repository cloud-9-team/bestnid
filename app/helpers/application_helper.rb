module ApplicationHelper
	def timeleft(t)

		content_tag :span, localize(t, format: :long_wo_year), title: localize(t, format: :db)

	end
end
