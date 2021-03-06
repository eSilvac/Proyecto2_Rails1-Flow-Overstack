module ApplicationHelper
	def markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
	                                      no_intra_emphasis: true,
	                                      fenced_code_blocks: true,
	                                      disable_indented_code_blocks: true,
	                                      autolink: true,
	                                      tables: true,
	                                      underline: true,
	                                      highlight: true
	                                     )
	   return markdown.render(text).html_safe
	 end

	def bootstrap_class_for(flash_type)
	  case flash_type
	  when "success"
	    "alert-success"   # Green
	  when "error"
	    "alert-danger"    # Red
	  when "alert"
	    "alert-warning"   # Yellow
	  when "notice"
	    "alert-info"      # Blue
	  else
	    flash_type.to_s
	  end
	 end	
end
