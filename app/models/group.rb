class Group < ApplicationRecord
  has_many :products, inverse_of: :group
  has_many :options, inverse_of: :group
  has_many :orders
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true
  belongs_to :user
  has_one_attached :shop_photo
  has_one_attached :qr_img
end
