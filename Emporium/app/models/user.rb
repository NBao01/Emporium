class User < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :books
  
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username
end
