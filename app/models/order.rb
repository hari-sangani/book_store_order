class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_books
  has_many :books, through: :orders_books

  validates :user_id, :date, :status, presence: true
end
