class AddCityToWoa < ActiveRecord::Migration[5.0]
  def change
    add_column :woas, :city, :string
  end
end
