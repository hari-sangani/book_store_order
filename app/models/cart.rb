class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true

  def total_price
    book.price * quantity
  end
end
