class User < ActiveRecord::Base
  class << self
      def find_or_create_from_auth_hash(auth)
        provider = auth_hash[:provider]
        uid = auth_hash[:uid]
        nickname = auth_hash[:info][:nickname]
        image_url = auth_hash[:info][:image]
    
        find_or_create_by(provider: provider, uid: uid) do |user|
          user.nickname = nickname
          user.image_url = image_url
        end
      end
  end
end
