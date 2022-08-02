class Collreview < ApplicationRecord
  belongs_to :college, optional: true
  belongs_to :user, optional: true
end
