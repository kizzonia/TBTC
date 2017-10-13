class Blog < ApplicationRecord
  mount_uploader :blogimg, BlogimgUploader
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :managment
end
