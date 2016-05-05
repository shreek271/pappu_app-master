class Product < ActiveRecord::Base

   has_many :order_items

   mount_uploader :photo, PhotoUploader
   validates :name, presence: true
   validates :price, presence: true
   validates :photo, presence: true
   validate  :photo_size

   private

   def photo_size
   	if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
   end
end
