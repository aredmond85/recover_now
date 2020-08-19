class CreateReportHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :report_heros, id: false do |t|
      t.references :report, index: false, foreign_key: true
      t.references :hero, index: false, foreign_key: true

      t.timestamps
    end
  end
end
