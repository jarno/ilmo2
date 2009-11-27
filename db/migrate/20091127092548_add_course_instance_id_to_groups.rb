class AddCourseInstanceIdToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :course_instance_id, :integer
  end

  def self.down
    remove_column :groups, :course_instance_id
  end
end
