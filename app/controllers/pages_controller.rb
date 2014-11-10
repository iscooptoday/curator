class PagesController < ApplicationController
	
  
  def home
  	 @topics=Topic.all
    end


  def contact
  end

end
