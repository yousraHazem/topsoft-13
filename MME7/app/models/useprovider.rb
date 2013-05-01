class Useprovider < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid

    def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |useprovider|
    useprovider.provider = auth.provider
      useprovider.uid = auth.uid
      useprovider.name = auth.info.name
      useprovider.oauth_token = auth.credentials.token
      useprovider.oauth_expires_at = Time.at(auth.credentials.expires_at)
      useprovider.save!
    end
  end
end
