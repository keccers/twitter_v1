class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)

    tweets.each do |tweet|
      Tweet.create(
        twitter_user_id: self.id, 
        text: tweet.text
      )
    end
  end

end
