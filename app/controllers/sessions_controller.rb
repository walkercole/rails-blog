class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.where(email: params[:email]).first
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "Logged in!"
			redirect_to home_path
		else
			flash[:error] = "Login Failed"
			redirect_to home_path
		end
	end
	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged Out"
		redirect_to home_path
	end
end