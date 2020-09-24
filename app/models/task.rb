class Task < ApplicationRecord

  attribute :is_completed

  after_initialize do |task|
    task.is_completed = is_completed?
  end
  
  # Model dependencies
  belongs_to :user

  # Model validation
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }

  private

  def is_completed?
    return false if self.completed_at.nil?
    true
  end
end
