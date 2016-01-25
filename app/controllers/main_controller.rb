class MainController < ApplicationController
  def index

  	if current_user 
  		redirect_to dashboard_path(current_user.name)
  	end

  end



  def dashboard
  	@basic = Basic.new
  	@user = current_user
    
  end


  def basicCreate
    basic = Basic.new(basic_params) 
    basic.user_id = current_user.id
    if basic.save
    	redirect_to dashboard_path
    else
    	render basicCreate
    end
  end


private

def right_user(username) 
  if username != current_user.name
       render '404_page'
       return
    end
  end

  def basic_params
    params.require(:basic).permit( :full_name , :email ,:phone ,:linkedin , :essential )
  end
  

end
