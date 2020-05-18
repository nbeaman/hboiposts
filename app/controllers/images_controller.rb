class ImagesController < ApplicationController

	def destroy
		@post = Post.find(params[:post_id])
		@image = @post.images.find(params[:id])
		@image.purge										# urge deletes attachment and blobs, destroy only deletes attachments in Active_Storage	
		redirect_to edit_post_path(params[:post_id])		# redirect to the same edit post you are editing.
	end

end
