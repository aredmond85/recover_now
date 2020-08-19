class AddVillainIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :villain_id, :integer
  end
end
