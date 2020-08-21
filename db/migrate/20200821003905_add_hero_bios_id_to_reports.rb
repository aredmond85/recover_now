class AddHeroBiosIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :hero_bio_id, :integer
  end
end
