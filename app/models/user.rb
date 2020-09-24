class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  # Model dependencies
  has_many :tasks

  # Model validation
  validates :name, presence: true, length: { minimum: 1, maximum: 255 }

  def count_tasks
    self.tasks.count
  end

  def completed_tasks
    self.tasks.where.not(completed_at: nil)
  end

  def uncompleted_tasks
    self.tasks.where(completed_at: nil)
  end
end
