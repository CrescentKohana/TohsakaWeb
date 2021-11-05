class Issue < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :category, presence: true
end
