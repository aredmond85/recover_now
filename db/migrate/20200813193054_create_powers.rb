class CreatePowers < ActiveRecord::Migration[6.0]
  def change
    create_table :powers do |t|
      t.string :power_type
      t.integer :power_id

      t.timestamps
    end
  end
end
