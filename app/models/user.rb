class User < ApplicationRecord
  has_many :authorizations
  validates :name, :discriminator, :avatar, :locale, :presence => true
end
