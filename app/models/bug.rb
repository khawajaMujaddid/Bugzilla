class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :assginee, class_name: 'User', foreign_key: 'assgined_to', optional: true

  validates :title, presence: true, length: { maximum: 20}
  validates :description, presence: true, length: { maximum: 100 }
  validates :priority, presence: true, inclusion: { in: %w(high medium low), message: "%{value} is not a valid priority"}
  validates :ETC, presence: true
end


