class Question < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :answers, dependent: :destroy 
end
