class AddHeroBiosIdToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :hero_bio_id, :integer
  end
end
