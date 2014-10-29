class PagesController < ApplicationController
	
  
  def home
  	 @link = current_user.links.build
    end

  def contact
  end

end
