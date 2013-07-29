class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    tweets = Twitter.user_timeline(self.username)

    tweets.each do |tweet|
      self.tweets.find_or_create_by_text(text:tweet.text)
      # Tweet.create(
      #   twitter_user_id: self.id, 
      #   text: tweet.text
      # )
    end
    # "false"
  end

end
