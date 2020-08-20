class AddVillainBiosIdToVillains < ActiveRecord::Migration[6.0]
  def change
    add_column :villains, :villain_bio_id, :integer
  end
end
