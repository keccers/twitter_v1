class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  def stale?
    if (Time.now - self.updated_at) >= 900
      true 
    else 
      false
    end
  end
end
