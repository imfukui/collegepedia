class Lesson < ApplicationRecord
  belongs_to :college
  has_many :course_reviews

  def self.ransackable_attributes(auth_object = nil)
    %w[professor title]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
