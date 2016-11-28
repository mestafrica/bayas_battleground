class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email(params[:email].downcase)
  	if user && user.authenticate(params[:password])
  		if user.email_confirmed
  			session[:user_id] = user.id
  			redirect_to tests_path, notice: 'Logged in!'
   #creepy line of code
  		else
  			flash.now[:error] = "Please activate your account by followinig the instructions in the confirmation email you received to proceed!!"
  			render 'new'
  		end
  	else
  		flash.now[:error] = "Invalid email/password combination"
  		render 'new'
  	end
  end 

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, notice: 'Logged out!'
  end


end
