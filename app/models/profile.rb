class Profile < ActiveRecord::Base
  belongs_to :user

  def gravatar_url
    if gravatar_email
      gravatar_email_hash = Digest::MD5.hexdigest(gravatar_email)
    else
       gravatar_email_hash = Digest::MD5.hexdigest(user.email)
    end

    "http://www.gravatar.com/avatar/#{gravatar_email_hash}"
  end
end
