class Lesson < ApplicationRecord
  belongs_to :college
  has_many :course_reviews

  validates :title, { presence: true }
  validates :professor, { presence: true }
  validates :department, { presence: true }

  def self.ransackable_attributes(auth_object = nil)
    %w[professor (and) title]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
