class Review < ApplicationRecord
    belongs_to :course
    # has_many :courses, :through => :course_students
end
