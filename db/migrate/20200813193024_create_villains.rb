class CreateVillains < ActiveRecord::Migration[6.0]
  def change
    create_table :villains do |t|
      t.string :villain_name
      t.integer :villain_id

      t.timestamps
    end
  end
end
