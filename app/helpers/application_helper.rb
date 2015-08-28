module ApplicationHelper
	def full_title(page_title)
		base_title = "Alpha"
		
		if page_title.empty?
			base_title
		else
			base_title + " | " + page_title
		end
	end

	def first_picture(value, image, format)
		first_image = value.first.image

		if first_image.nil?
			"/assets/default_watch.jpg"
		else
			picture_url(first_image, format)
		end	
	end

	def picture_url(first_image, format)
		first_image.url(format)
	end
end
