class CourseReview < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  belongs_to :college

  validates :exam, { presence: true }
  validates :quiz, { presence: true }
  validates :assignment, { presence: true }
  validates :gradedist, { presence: true }
  validates :comment, { presence: true }
  validates :gradegot, { presence: true }
  validates :rate, { presence: true }
end
