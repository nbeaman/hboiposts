class Post < ApplicationRecord

	validates :title, presence: true
	validates :content, presence: true

	has_many :comments, :dependent => :destroy

	has_many_attached :images, :dependent => :destroy

	attr_accessor :keep_images

	def thumbnail input
		return self.images[input].variant(resize: '200x200').processed
	end

end
