class Talkabout < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user

  def self.allowed_params
    [:check, :content, :profile_id]
  end
end
