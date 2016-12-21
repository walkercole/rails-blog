class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@user = User.find params[:id]
		
	end
		def destroy
		@user = User.find params[:id]
		@user.destroy
		redirect_to users_path
	end
	def new

	end
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Your account was created successfully."
			redirect_to users_path @user
		else
			raise "oops"
		end
	end
	def edit
		@user = User.find params[:id]
	end
	def update
		@user = User.find params[:id]
			if @user.update params[:user]
				flash[:notice] = "Account updated!"
				redirect_to @user
			else
			raise "oops"
		end
	end
	def search
		@user = User.find_by username: params[:query]
	if @user
		redirect_to @user
	else 
		flash[:error] = "Failed to find user"
		redirect_to root_path
		end
	end
end