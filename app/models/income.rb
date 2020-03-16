class Income < ApplicationRecord
  validates :name,:description, presence: true
end
