class AddCoordinatesToWoas < ActiveRecord::Migration[5.0]
  def change
    add_column :woas, :latitude, :float
    add_column :woas, :longitude, :float
  end
end
