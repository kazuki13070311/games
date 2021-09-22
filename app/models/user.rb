class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visiter_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
