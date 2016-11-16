class Booking < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :woa, class_name: 'Woa'

  # validates :book_start_at, :book_end_at, presence: true
  validates :owner_rating, :renter_rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }, numericality: { only_integer: true }

end
