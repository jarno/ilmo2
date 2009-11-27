class CreateCourseInstances < ActiveRecord::Migration
  def self.up
    create_table :course_instances do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :course_instances
  end
end
