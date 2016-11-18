class RemoveLocationFromWoa < ActiveRecord::Migration[5.0]
  def change
    remove_column :woas, :location, :string
  end
end
