class User < ActiveRecord::Base

  def self.create_or_find_by_oauth(oauth_hash)
    existing_user = User.find_by(provider: oauth_hash[:provider], uid: oauth_hash[:uid])
    if existing_user
      return existing_user
    else
      user = User.new(provider: oauth_hash[:provider], uid: oauth_hash[:uid], email: oauth_hash[:info][:email], username: oauth_hash[:info][:name])
      user.save
      return user
    end
  end
end