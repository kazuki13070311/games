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

  #scope :qq, -> { where('name LIKE ? OR name LIKE ?', '%かっちゃん%', '%テスト%').pluck(:name) }
  scope :qq, -> { where('name LIKE ?', '%かっちゃん%').pluck(:name).sort_by{|x| x.scan(/\d+|[A-Za-z]/).map{|s| s.to_i.to_s == s ? s.to_i : s} } }
  # scope :test, -> { match(/(?<name>[^0-9]+)(?<number>[0-9])/)||{}}[:name]
  #scope :tests, -> { where("name like? ", '%か%').match?(/(?<name>[^0-9]+)(?<number>[0-9]+)?)/}

  #def test
  #  match = self.match(/(?<name>[^0-9]+)(?<number>[0-9])/)
  #    return self.match
  #end
end
