class Woa < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, foreign_key: 'woa_id'
end
