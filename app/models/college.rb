class College < ApplicationRecord
  has_many :collreviews
  has_many :lessons

  def self.ransackable_attributes(auth_object = nil)
    %w[name address]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
