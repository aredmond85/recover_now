class CreateHeroBios < ActiveRecord::Migration[6.0]
  def change
    create_table :hero_bios do |t|
      t.text :hero_summary
      t.text :hero_powers
      t.integer :hero_id

      t.timestamps
    end
  end
end
