class College < ApplicationRecord
  has_many :collreviews, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :course_reviews, dependent: :destroy

  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :sector, { presence: true }
  validates :estyear, { presence: true }
  validates :mingpa, { presence: true }
  validates :description, { presence: true }

  def self.ransackable_attributes(auth_object = nil)
    %w[name (and) address]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
