class ImagesController < ApplicationController

	def show
		# don't show the regular menu bar b/c these are photos on a black background
		# a special views/layout/carousel.html.erg has been created for this
		render :layout => 'carousel'
	end

	def destroy
		@post = Post.find(params[:post_id])
		@image = @post.images.find(params[:id])
		@image.purge										# urge deletes attachment and blobs, destroy only deletes attachments in Active_Storage	
		redirect_to edit_post_path(params[:post_id])		# redirect to the same edit post you are editing.
	end

end
