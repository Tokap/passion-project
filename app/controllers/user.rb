
get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  user_hash = params[:user]
  @user = User.create(user_hash)
  @user.valid?
  if @user.valid?
    #success
    session[:user_id] = @user.id
    redirect '/'
  else
    #failure
    erb :'users/new'
  end
end

get '/login' do
  @user = User.new
  erb :'login/login'
end

post '/login' do
  user_hash = params[:user]
  @user = User.authenticate(user_hash[:email], user_hash[:password])
  if @user
    #success
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    #failure
    @user = User.new(user_hash)
    @errors = ["credentials don't match our records"]
    erb :'users/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end