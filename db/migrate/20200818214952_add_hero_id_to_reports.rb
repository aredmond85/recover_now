class AddHeroIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :hero_id, :integer
  end
end
