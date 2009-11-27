class AddCourseIdToCourseInstances < ActiveRecord::Migration
  def self.up
    add_column :course_instances, :course_id, :integer
  end

  def self.down
    remove_column :course_instances, :course_id
  end
end
