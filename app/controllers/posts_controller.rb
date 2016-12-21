class PostsController < ApplicationController
	def index
		@posts = Post.all	
	end

	def new
	end

	def create
		@post = Post.new(params[:post]) 
		@post.user = current_user
		if @post.save
			flash[:notice] = "Post successfully created!"
			redirect_to current_user
		else
			raise "oops something went wrong: #{@post.errors.full_messages}"
		end
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post = Post.find params[:id]
			if @post.update params[:post]
				flash[:notice] = "Post updated!"
				redirect_to current_user
			else
			raise "oops"
		end
	end

	def destroy

	end

	def show
		@post = Post.find params[:id]
	end
end