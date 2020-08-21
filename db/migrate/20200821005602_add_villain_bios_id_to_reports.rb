class AddVillainBiosIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :villain_bio_id, :integer
  end
end
