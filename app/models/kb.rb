class Kb < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :managment
end
