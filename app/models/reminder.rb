class Reminder < ApplicationRecord
  validates :datetime, presence: true
end
