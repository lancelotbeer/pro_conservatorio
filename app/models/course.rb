class Course < ApplicationRecord
  has_many :orders, dependent: :delete_all
  has_many :users, through: :orders
  has_many :orders
end
