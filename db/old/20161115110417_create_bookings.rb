class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :renter, references: :user, foreign_key: true
      t.references :woa, referrences: :woa, foreign_key: true
      t.date :book_start_at
      t.date :book_end_at
      t.date :validated_at
      t.date :paid_at
      t.integer :owner_rating
      t.text :owner_comment
      t.integer :renter_rating
      t.text :renter_comment

      t.timestamps

      # Previously, in our model, booking was linled to a table named
      # 'reviews that handled the ratings and comments from renter/owner.
      # We decided to remove 'reviews' table and added 4 new fields
      # in the 'bookings' table instead in order to lesser the numnber
      # of tables and therefore simplify the DB model:
      # - owner_rating
      # - owner_comment
      # - renter_rating
      # - renter_comment
    end
  end
end
