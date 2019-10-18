class Group < ApplicationRecord
  has_many :products, inverse_of: :group, :dependent => :destroy
  has_many :options, inverse_of: :group, :dependent => :destroy
  has_many :orders
  has_many :follows
  has_many :users, through: :follows
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true
  belongs_to :user
  has_one_attached :shop_photo
  has_one_attached :qr_img
  validates :title, presence: true

  default_scope -> { order('created_at DESC') }

  def total_price
    orders.reduce(0){ |acc, order|
      acc + order.total_price
    }
  end

end
