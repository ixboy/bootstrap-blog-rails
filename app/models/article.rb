class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  paginates_per 10
  # Scopes
  default_scope { order(created_at: :desc) }
  scope :without_featured, ->(ids) { where('id NOT IN(?)', ids) if ids.present? }
  scope :filtered_by_category, ->(category) { where(category_id: category.id) if category.present? }
  scope :filtered_by_archive, lambda { |month_year|
    if month_year
      date = Date.strptime(month_year, '%B %Y')
      where(created_at: date.beginning_of_month..date.end_of_month.next_day)
    end
  }
end
