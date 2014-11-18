class PagesController < ApplicationController
	
  
  def home
  	@link=Link.new
  	@links=Link.all

  	@link_attachment=Link_attachment.new
  	@link_attachments=Link_attachments.all
  
  
    end


  def contact
  end

end
