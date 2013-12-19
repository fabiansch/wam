class Profile < ActiveRecord::Base
  belongs_to :user

  def gravatar_url
    gravatar_email_hash = Digest::MD5.hexdigest(gravatar_email)
    "http://www.gravatar.com/avatar/#{gravatar_email_hash}"
  end
end
