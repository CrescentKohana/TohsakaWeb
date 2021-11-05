class Reminder < ApplicationRecord
  belongs_to :user

  attr_accessor :repeat_day, :repeat_hour, :repeat_min

  validates :datetime, presence: true
  validates :channel_id, presence: true, numericality: { only_integer: true }
  validates :repeat, allow_nil: true, numericality: { only_integer: true, accept: {greater_than: 600, equal_to: 0} }

  validate :repeat_interval_as_seconds

  private
  def repeat_interval_as_seconds
    minutes = self.repeat_min.to_i
    hours = self.repeat_hour.to_i
    days = self.repeat_day.to_i

    if minutes < 0 || hours < 0 || days < 0
      errors.add(:base, "Negative values aren't allowed.")
    else
      seconds = (minutes * 60) + (hours * 60 * 60) + (days * 24 * 60 * 60)
      unless seconds == 0
        errors.add(:base, "Interval has to be 12 hours or more.") if seconds < 43200
      end
    end
  end
end
