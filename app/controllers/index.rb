get '/' do
  erb :'index'
end

post '/get-tweets' do
  @user = TwitterUser.find_or_create_by_username(params[:username])

  @user.fetch_tweets! if @user.tweets.empty? || @user.tweets.last.stale?

  redirect "/#{params[:username]}"
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  if @user
    @tweets = @user.tweets.limit(10)
  else
    redirect '/'
  end
  
  erb :'user'
end
