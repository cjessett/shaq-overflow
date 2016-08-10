get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/user/#{user.username}"
  else
    erb :login
  end
end

get 'logout' do
  session.delete(:user_id)
  redirect '/'
end
