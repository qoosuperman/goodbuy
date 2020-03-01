module GoogleAuthable
  extend ActiveSupport::Concern

  class_methods do
    def find_for_google_oauth2(access_token, _signed_in_resource = nil)
      data = access_token.info
      user = User.where(google_token: access_token.credentials.token, google_uid: access_token.uid).first
      if user
        return user
      else
        existing_user = User.where(email: data['email']).first
        if existing_user
          existing_user.google_uid = access_token.uid
          existing_user.google_token = access_token.credentials.token
          existing_user.save!
          return existing_user
        else
          # Uncomment the section below if you want users to be created if they don't exist
          user = User.create(
            name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0, 20],
            google_token: access_token.credentials.token,
            google_uid: access_token.uid
          )
        end
      end
    end
  end
end
