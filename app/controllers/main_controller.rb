class MainController < ApplicationController
  def index
  	
  	if current_user 
  		redirect_to dashboard_path(current_user.name)
  	end

  end



  def dashboard

  end

end
