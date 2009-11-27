class CourseInstance < ActiveRecord::Base
  belongs_to :course
  has_many :groups, :dependent => :destroy
end
