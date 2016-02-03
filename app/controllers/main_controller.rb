class MainController < ApplicationController
  def index

  	if current_user 
  		redirect_to dashboard_path(current_user.name)
  	end

  end



  def dashboard
  	@var = params[:data]
  	@user = current_user
   
    if @user.basic == nil
      @basic = Basic.new
    else 
      @basic = @user.basic
    end


     if  user_params
     respond_to do |format|
   
      if @user.update(user_params)
        format.js {}
      else
        format.js {}
      end
    end
  end
  	
  end

  def basic
     @user= current_user
     if @user.basic == nil
      
        basic = Basic.new(basic_params) 
        basic.user_id = current_user.id
        respond_to do |format|
          if basic.save
            @basic = basic
            format.js {}
          else
            @basic = basic
            format.js {}
          end
       end

      else 
       respond_to do |format|
        if current_user.basic.update(basic_params)
          @basic = current_user.basic

           format.js {render 'basic'}
        else
          @basic = current_user.basic

           format.js {render 'basic'}
       end
      end
    end



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

  def user_params
    if params[:user]
  	
        params.require(:user).permit( educations_attributes: [:id, :degree ,:year , :college ,:_destroy] , projects_attributes:[:id , :proj_name , :proj_des,:proj_add ,:_destroy] , exps_attributes:[:id , :comp_name , :comp_location , :role , :duration ,:role_des,:_destroy] , skills_attributes: [:id , :skill_name , :_destroy])
    else 
      return false
    end
  end

