class AddReportIdToHeros < ActiveRecord::Migration[6.0]
  def change
    add_column :heros, :report_id, :int
  end
end
