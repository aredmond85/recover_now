class AddReportIdToVillains < ActiveRecord::Migration[6.0]
  def change
    add_column :villains, :report_id, :int
  end
end
