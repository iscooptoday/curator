class PagesController < ApplicationController
	
  
  def home
  	 if user_signed_in? 
  	 @link = current_user.links.build
    
    end
end

  def contact
  end

end
