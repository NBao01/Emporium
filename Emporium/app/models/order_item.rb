class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  def validate
    errors.add(:amount, "should be one or more") unless amount.nil? || amount > 0 
    errors.add(:price, "should be a positive number") unless price.nil? || price > 0.0 
  end
end
