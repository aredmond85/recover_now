class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :subject
      t.text :description
      t.string :damage_type
      t.string :hero
      t.string :villain 
      t.integer :casualties

      t.timestamps
    end
  end
end
