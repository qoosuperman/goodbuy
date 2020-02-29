# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  address     :string
#  phone       :string
#  is_active   :boolean          default(TRUE)
#  start_time  :datetime
#  end_time    :datetime
#  is_public   :boolean          default(FALSE)
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follow_id   :bigint
#

class Group < ApplicationRecord
  has_many :products, inverse_of: :group, dependent: :destroy
  has_many :options, inverse_of: :group, dependent: :destroy
  has_many :orders
  has_many :follows
  has_many :users, through: :follows
  accepts_nested_attributes_for :products, allow_destroy: true
  accepts_nested_attributes_for :options, allow_destroy: true
  belongs_to :user
  has_one_attached :shop_photo
  has_one_attached :qr_img
  validates :title, presence: true

  scope :createtime_desc, -> { order('created_at DESC') }

  def total_price
    orders.reduce(0) do |acc, order|
      acc + order.total_price
    end
  end
end
