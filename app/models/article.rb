class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  paginates_per 6
  # Scopes
  default_scope { order(created_at: :desc) }
  scope :without_featured, ->(ids) { where('id NOT IN(?)', ids) if ids.present? }
  scope :filtered_by_category, ->(category) { where(category_id: category.id) if category.present? }
end
