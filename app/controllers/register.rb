get '/register' do
  erb :register
end

post '/register' do
  user = User.new(params[:user])
  if user.save
    redirect '/login'
  else
    redirect '/register'
  end
end
