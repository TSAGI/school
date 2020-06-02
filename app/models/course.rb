class Course < ApplicationRecord
    # has_many :students, :reviews
    has_many :course_students
    has_many :students, :through => :course_students
    belongs_to :teacher
end
