class RemoveTypeFromWoas < ActiveRecord::Migration[5.0]
  def change
    remove_column :woas, :type, :string
  end
end
