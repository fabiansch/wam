class Profile < ActiveRecord::Base
  belongs_to :user

  def gravatar_url(size = nil)
    hash = Digest::MD5.hexdigest(gravatar_email) unless gravatar_email.blank?
    hash = Digest::MD5.hexdigest(user.email) if hash.blank?
    case size
    when :small
      hash << '?s=40'
    when :medium
      hash << '?s=400'
    when :big
      hash << '?s=1024'
    end
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def twitter_url
    "https://www.twitter.com/#{twitter_handle}" unless twitter_handle.blank?
  end

  def xing_url
    "https://www.xing.com/#{xing_handle}" unless xing_handle.blank?
  end

  def linkedin_url
    "https://www.linkedin.com/#{linkedin_handle}" unless linkedin_handle.blank?
  end

  def self.allowed_params
    [:name, :job, :city, :aboutme, :gravatar_email, :company,
      :twitter_handle, :xing_handle, :linkedin_handle,
      :meet_for_coffee, :attend_meetings, :be_mentor, :own_like_string]
  end
end
