class Profile < ActiveRecord::Base
  belongs_to :user

  def gravatar_url
    hash = Digest::MD5.hexdigest(gravatar_email) unless gravatar_email.blank?
    hash = Digest::MD5.hexdigest(user.email) if hash.blank?
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def self.allowed_params
    [:name, :job, :city, :aboutme, :gravatar_email, :company,
      :twitter_handle, :xing_handle, :linkedin_handle]
  end
end
