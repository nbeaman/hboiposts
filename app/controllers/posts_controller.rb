class PostsController < ApplicationController

	def index
		@posts = Post.order('posts.created_at DESC').first(10)		#Get first 10 posts and order by the date created.
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if(@post.save)
			if(@post.keep_images)
				@post.images.attach(params[:post][:keep_images])
			end			
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if(@post.update(post_params))
			#byebug
			if(@post.keep_images)
				@post.images.attach(params[:post][:keep_images])
			end
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit(:title, :content, keep_images: []) 
	end


end