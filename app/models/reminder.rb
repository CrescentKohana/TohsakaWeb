class Reminder < ApplicationRecord
  validates :datetime, presence: true
  validates :channel, presence: true, numericality: { only_integer: true }
  validates :repeat, allow_nil: true, numericality: { only_integer: true, accept: {greater_than: 600, equal_to: 0} }
end
