class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # Scopes
  default_scope { order(created_at: :desc) }
  scope :recent_three, -> { order(created_at: :desc).first(3) }
end
