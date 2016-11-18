class Booking < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :woa, class_name: 'Woa'

  # validates :renter_id, :woa_id, :book_start_at, :book_end_at, presence: true
  validates :owner_rating, :renter_rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: true }

  def show

  end

end
