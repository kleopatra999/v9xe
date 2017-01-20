
#require 'carrierwave/orm/mongoid'
class Gridimage
  include Mongoid::Document
	mount_uploader :image, ImageUploader
  belongs_to :user
end
