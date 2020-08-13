class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.string :hero_name
      t.integer :hero_id

      t.timestamps
    end
  end
end
