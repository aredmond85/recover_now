class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :subject
      t.text :description
      t.string :report_id

      t.timestamps
    end
  end
end
