class Group < ApplicationRecord
  has_many :products
  has_many :options
  accepts_nested_attributes_for :products, :options, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  has_one_attached :shop_photo
end
