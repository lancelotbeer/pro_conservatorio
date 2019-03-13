class Course < ApplicationRecord
  mount_uploader :image,ImagesUploader

  has_many :orders, dependent: :delete_all
  has_many :users, through: :orders
  has_many :orders

  enum tipo: [:carrera, :curso]

end
