class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
