class Trigger < ApplicationRecord
  validates :phrase, presence: true
  validates :mode, presence: true
  validates :server_id, presence: true
  #validate :reply_xor_file

  mount_uploader :file, FileUploader

  private
  def reply_xor_file
    unless reply.blank? ^ file.blank?
      errors.add(:base, "Specify a reply or a file, not both")
    end
  end
end
