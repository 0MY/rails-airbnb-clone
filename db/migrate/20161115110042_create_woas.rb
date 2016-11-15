class CreateWoas < ActiveRecord::Migration[5.0]
  def change
    create_table :woas do |t|
      t.string :title
      t.string :type
      t.text :description
      t.integer :price
      t.integer :deposit
      t.text :location
      t.date :rent_start_at
      t.date :rent_end_at
      t.references :owner, index: true
      t.string :size
      t.boolean :hooked_on_wall
      t.boolean :needs_power
      t.boolean :needs_pedestal
      t.boolean :needs_wifi
      t.boolean :needs_hygrometry
      t.boolean :needs_temperature
      t.boolean :needs_glass
      t.boolean :needs_alarm

      t.timestamps

      # We need a picture of the woa but this will be processed by
      # attachinary and needs no field in the woas table.
    end
    add_foreign_key :woas, :users, column: :owner_id
  end
end
