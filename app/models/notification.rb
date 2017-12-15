
class Notification < ApplicationRecord

  # belongs_to :user

  has_many :messages, dependent: :destroy
  # validates :topic, presence: true, uniqueness: true, case_sensitive: false

  validates :name, presence: true
  validates :captureSource, presence: true
  validates :displayUrls, presence: true
  validates :message, presence: true
 
end
