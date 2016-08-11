get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  Question.create!(title: params[:title], content: params[:question], user_id: session[:user_id])
  redirect to '/questions'
end

get "/questions/new" do
 erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  @answers = @question.answers

  erb :question
end

post '/questions/:question_id/answers' do
  # raise params.inspect
  if !current_user
    redirect '/login'
  end
  q_id = params[:question_id]
  Answer.create(content: params[:answer], user_id: session[:user_id], question_id: q_id )

  redirect "/questions/#{q_id}"
end

get "/questions/:id/votes/up" do
  if current_user
    Vote.create(value: 1, votable: Question.find(params[:id]), user: current_user)
  else
    redirect '/login'
  end
end

get "/questions/:id/votes/down" do
    if current_user
      Vote.create(value: -1, votable: Question.find(params[:id]), user: current_user)
  else
    redirect '/login'
  end
end

