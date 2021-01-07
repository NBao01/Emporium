class User < ApplicationRecord
  has_many :comments
  
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username
end
