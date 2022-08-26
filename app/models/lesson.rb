class Lesson < ApplicationRecord
  belongs_to :college
  has_many :course_reviews
end
