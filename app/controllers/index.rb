get '/' do
  erb :'index'
end

get '/:username' do
  erb :'username'
end
