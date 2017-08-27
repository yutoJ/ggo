class Photo < ApplicationRecord
  belongs_to :gadget
  mount_uploader :image, ImageUploader

  #has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
end
