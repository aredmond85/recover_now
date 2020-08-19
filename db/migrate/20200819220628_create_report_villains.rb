class CreateReportVillains < ActiveRecord::Migration[6.0]
  def change
    create_table :report_villains do |t|
      t.integer :report_id
      t.integer :villain_id
    end
  end
end
