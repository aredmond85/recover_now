class CreateReportHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :report_heros do |t|
      t.integer :report_id
      t.integer :hero_id
    end
  end
end
