class PagesController < ApplicationController
	
  
  def home
  	@link=Link.new
  	@links=Link.all

  	
  
    end


  def contact
  end

end
