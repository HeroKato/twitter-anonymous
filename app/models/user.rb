class User < ActiveRecord::Base
   #引数に関連するユーザーが存在すればそれを返し、存在しなければ新規に作成する
  class << self
      def find_or_create_from_auth(auth)
    #OmniAuthで取得した各データを代入していく
        provider = auth[:provider]
        uid = auth[:uid]
        nickname = auth[:info][:nickname]
        name = auth[:info][:name]
        image_url = auth[:info][:image]
        description = auth[:info][:description]
    
        User.find_or_create_by(provider: provider, uid: uid) do |user|
          user.nickname = nickname
          user.name = name
          user.image_url = image_url
          user.discription = discription
        end
      end
  end
end
