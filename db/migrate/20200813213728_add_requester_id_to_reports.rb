class AddRequesterIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :requester_id, :int
  end
end
