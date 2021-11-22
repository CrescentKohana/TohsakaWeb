class Issue < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :category, presence: true
  validates :server_id, presence: true, numericality: { only_integer: true }

  private
end
