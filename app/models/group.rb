class Group < ApplicationRecord
  has_many :products
  has_many :options
  has_many :orders
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true
  belongs_to :user
  has_one_attached :shop_photo
end
