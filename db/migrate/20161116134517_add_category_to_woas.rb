class AddCategoryToWoas < ActiveRecord::Migration[5.0]
  def change
    add_column :woas, :category, :string
  end
end
