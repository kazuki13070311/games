class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
