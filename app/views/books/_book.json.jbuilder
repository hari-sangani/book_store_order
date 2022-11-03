json.extract! book, :id, :publisher_id, :title, :isbndb, :publish_date, :language, :mrp, :discount, :price, :paperback, :quantity, :active, :created_at, :updated_at
json.url book_url(book, format: :json)
