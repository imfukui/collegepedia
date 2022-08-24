class College < ApplicationRecord
  has_many :collreviews
  has_many :lessons
end
