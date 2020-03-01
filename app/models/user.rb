# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  nick_name              :string           default(""), not null
#  bank_account           :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fb_uid                 :string
#  fb_token               :string
#  google_uid             :string
#  google_token           :string
#  follow_id              :bigint
#

class User < ApplicationRecord
  has_many :groups
  has_many :orders, foreign_key: 'buyer_id', inverse_of: 'buyer'
  has_many :follows
  has_many :followed_groups, through: :follows, source: :group
  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  include FbAuthable
  include GoogleAuthable
end
