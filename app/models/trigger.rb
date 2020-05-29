class Trigger < ApplicationRecord
  validates :phrase, presence: true
  validates :mode, presence: true
  validates :server_id, presence: true

  validate :reply_and_file_blank

  mount_uploader :file, FileUploader
  validates :file, file_size: { less_than: 8.megabytes }

  private
  def reply_and_file_blank
    if !reply.blank? && !file.filename.nil?
      errors.add(:base, "Specify a reply or a file, not both")
    end
  end
end
