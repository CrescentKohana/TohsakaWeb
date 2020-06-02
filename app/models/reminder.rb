class Reminder < ApplicationRecord
  attr_accessor :repeat_day, :repeat_hour, :repeat_min

  validates :datetime, presence: true
  validates :channel, presence: true, numericality: { only_integer: true }
  validates :repeat, allow_nil: true, numericality: { only_integer: true, accept: {greater_than: 600, equal_to: 0} }

  validate :repeat_interval_as_seconds

  private
  def repeat_interval_as_seconds
    seconds = (self.repeat_min.to_i * 60) + (self.repeat_hour.to_i * 60 * 60) + (self.repeat_day.to_i * 24 * 60 * 60)
    if seconds < 43200
      errors.add(:base, "Interval has to be 12 hours or more.")
    end
  end
end
