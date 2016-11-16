class AddGpsCoordToWoa < ActiveRecord::Migration[5.0]
  def change
    add_column :woas, :lat, :float
    add_column :woas, :lng, :float
  end
end
