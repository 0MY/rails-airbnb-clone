class RemoveLatLngFromWoas < ActiveRecord::Migration[5.0]
  def change
    remove_column :woas, :lat, :float
    remove_column :woas, :lng, :float
  end
end
