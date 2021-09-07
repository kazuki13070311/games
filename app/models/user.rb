class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments
end
