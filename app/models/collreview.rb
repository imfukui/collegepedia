class Collreview < ApplicationRecord
  belongs_to :college, optional: true
  belongs_to :user, optional: true

  validates :sub, {presence: true}
  validates :tuition, {presence: true}
  validates :scale, {presence: true}
  validates :environment, {presence: true}
  validates :pros, {presence: true}
  validates :cons, {presence: true}
end
