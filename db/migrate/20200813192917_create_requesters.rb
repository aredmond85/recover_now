class CreateRequesters < ActiveRecord::Migration[6.0]
  def change
    create_table :requesters do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :requester_id

      t.timestamps
    end
  end
end
