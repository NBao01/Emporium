json.extract! book, :id, :title, :publisher_id, :published_at, :isbn, :blurb, :page_count, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
