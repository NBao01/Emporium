class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :publisher

  validates_length_of :title, :in => 1..255
  validates_presence_of :publisher
  validates_presence_of :authors
  validates_presence_of :published_at
  validates_numericality_of :page_count, :only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with => /[0-9\-xX]{13}/
  validates_uniqueness_of :isbn

  def author_names
    self.authors.map do |a|
      a.name
    end.join(", ") rescue ""
  end

  def self.latest
    # order("books.id desc").all
    order("books.id desc").reverse_order.limit(10).reverse
  end
end