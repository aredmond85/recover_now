class AddReportIdToPowers < ActiveRecord::Migration[6.0]
  def change
    add_column :powers, :report_id, :int
  end
end
