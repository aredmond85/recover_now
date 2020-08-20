class CreateVillainBios < ActiveRecord::Migration[6.0]
  def change
    create_table :villain_bios do |t|
      t.text :villain_summary
      t.text :villain_powers
      t.integer :villain_id

      t.timestamps
    end
  end
end
