class Woa < ApplicationRecord
  TYPES = [ "Sculptur", "Painting", "Electronic Art", "Video", "Figurin", "Statue", "Antique","Objet d'Art" ]
  SIZES = [ "S", "M", "L" ]

  belongs_to :owner, class_name: 'User'
  has_many :bookings, foreign_key: 'woa_id', dependent: :destroy
  has_attachment :photo

  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  # validates :title, :price, :type, :rent_start_at, presence: true

  ## copied from yelp
  # scope :sorted_by_ratings, -> { all.sort_by { |restaurant| -restaurant.average_rating } }

  # def average_rating
  #   avg = reviews.reduce(0) { |sum, review| sum += review.rating.to_f / reviews.count }
  #   avg.round(2)
  # end

end
