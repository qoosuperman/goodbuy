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

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:invalid_user) { build(:user, :invalid) }
  let(:token_hash) do
    {
      info: {
        name: 'name',
        email: 'email@gmail.com'
      },
      credentials: {
        token: 'token'
      },
      uid: 'uid'
    }
  end
  let(:token) { JSON.parse(token_hash.to_json, object_class: OpenStruct) }

  describe 'factorybot data' do
    it '做出 user 是有效的' do
      expect(user).to be_valid
    end
    it 'user 沒有 name 是無效的' do
      expect(invalid_user).not_to be_valid
    end
  end

  describe 'google auth' do
    describe '#self.find_for_google_oauth2' do
      subject { described_class.find_for_google_oauth2(token) }

      context 'when user already in DB with google auth' do
        let!(:user) { create(:user, google_token: 'token', google_uid: 'uid') }

        it 'return the user in DB' do
          expect(subject).to eq(user)
        end
      end

      context 'when user already in DB but without google auth' do
        let!(:user) { create(:user, email: 'email@gmail.com') }

        it 'return the user in DB and add google token/uid' do
          expect(subject).to eq(user)
          expect(user.reload.google_token).to eq('token')
          expect(user.reload.google_uid).to eq('uid')
        end
      end

      context 'when user not in DB' do
        let(:user) { User.first }

        it 'should create a new User with token and uid' do
          expect { subject }.to change { User.count }.by(1)
          expect(user.name).to eq('name')
          expect(user.email).to eq('email@gmail.com')
          expect(user.google_token).to eq('token')
          expect(user.google_uid).to eq('uid')
        end
      end
    end
  end

  describe 'facebook auth' do
    describe '#self.from_omniauth' do
      subject { described_class.from_omniauth(token) }

      context 'when user already in DB with FB' do
        let!(:user) { create(:user, fb_uid: 'uid') }

        it 'should return the user in DB and save fb_token' do
          expect(subject).to eq(user)
          expect(user.reload.fb_token).to eq('token')
        end
      end

      context 'when user already in DB but without FB record' do
        let!(:user) { create(:user, email: 'email@gmail.com') }

        it 'return the user in DB and add fb token/uid' do
          expect(subject).to eq(user)
          expect(user.reload.fb_token).to eq('token')
          expect(user.reload.fb_uid).to eq('uid')
        end
      end

      context 'when user not in DB' do
        let(:user) { User.first }

        it 'should create a new User with token and uid' do
          expect { subject }.to change { User.count }.by(1)
          expect(user.name).to eq('name')
          expect(user.email).to eq('email@gmail.com')
          expect(user.fb_token).to eq('token')
          expect(user.fb_uid).to eq('uid')
        end
      end
    end
  end
end
