class Course < ActiveRecord::Base
  named_scope :find_all, :order => "created_at DESC"
  has_many :course_instances, :dependent => :destroy
end
