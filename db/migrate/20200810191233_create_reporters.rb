class CreateReporters < ActiveRecord::Migration[6.0]
  def change
    create_table :reporters do |t|

      t.timestamps
    end
  end
end
