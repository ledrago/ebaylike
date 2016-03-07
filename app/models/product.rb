class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :user_id, presence: false
  default_scope -> {order(created_at: :desc)}
  validates :title, length: {in: 3..50 }
  validates :price, numericality: {greater_than: 0}
  validates :category_id, confirmation: true
  validates :description, allow_blank:true, length: {minimum: 2}
  ratyrate_rateable 'quality'
  acts_as_commentable
  is_impressionable
end
