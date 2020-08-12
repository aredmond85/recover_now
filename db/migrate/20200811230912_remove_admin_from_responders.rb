class RemoveAdminFromResponders < ActiveRecord::Migration[6.0]
  def change
    remove_column :responders, :admin, :boolean
  end
end
