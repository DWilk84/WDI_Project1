class RemoveLocationIdFromClassrooms < ActiveRecord::Migration
  def up
    remove_column :classrooms, :location_id
  end

  def down
    add_column :classrooms, :location_id, :integer
  end
end
