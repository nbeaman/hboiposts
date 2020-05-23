class Post < ApplicationRecord

	validates :title, presence: true
	validates :content, presence: true

	has_many :comments, :dependent => :destroy

	has_many_attached :images, :dependent => :destroy

	validate :correct_image_type
	
	attr_accessor :keep_images

	def thumbnail input
		return self.images[input].variant(resize: '200x200').processed
	end

	def correct_image_type
		#byebug
		# keep_images[0].content_type
		# usually this is images.attached?  , but I'm using keep_images due to 
		# overwrite images problems in active storage
		if self.keep_images != nil 
			(0...self.keep_images.count).each do |i|
				if !self.keep_images[i].content_type.in?(%w(image/jpeg image/png application/pdf))
					# both :images and :keep_images work for the code below ????
					errors.add(:images, 'must be a JPEG or PNG')
				end
			end
		end
	end

end
