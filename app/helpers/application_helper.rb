module ApplicationHelper

	def full_title(page_title)
		base_title = "Mailer Application"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title.capitalize}"
		end
	end

end
