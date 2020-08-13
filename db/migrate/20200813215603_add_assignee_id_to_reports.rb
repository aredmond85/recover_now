class AddAssigneeIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :assignee_id, :int
  end
end
