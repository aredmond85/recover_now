class CreateAssignees < ActiveRecord::Migration[6.0]
  def change
    create_table :assignees do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :assignee_id

      t.timestamps
    end
  end
end