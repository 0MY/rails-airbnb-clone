class Woa < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, foreign_key: 'woa_id'

  TYPES = [ "Sculptur", "Painting", "Electronic Art", "Video", "Figurin", "Statue", "Antique","Objet d'Art" ]
  SIZES = [ "S", "M", "L" ]
end
