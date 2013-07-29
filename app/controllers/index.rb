get '/' do
  erb :'index'
end

post '/get-tweets' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  
  redirect "/#{@user.username}"
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])

  if @user.tweets.empty? || @user.tweets.last.stale?
    @waiting = "true"
    erb :user
  else
    @tweets = @user.tweets.limit(10)
    erb :user
  end 
end

post '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  @user.fetch_tweets!

  erb :user, layout: false
end



