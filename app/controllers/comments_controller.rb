class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		#byebug
		if(@comment.errors.any?)
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end
	end

	def destroy
		#byebug
		@post = Post.find(params[:id])
		@comment = @post.comments.find(params[:post_id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private def comment_params
		params.require(:comment).permit(:uname, :content)
	end

end
