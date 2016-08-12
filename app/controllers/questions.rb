get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  params['question']['user'] = current_user
  Question.create(params[:question])
  redirect to '/questions'
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    redirect '/login'
  end
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  @answers = @question.answers.order(favorite: :desc)
  erb :'/questions/show'
end


# submit answer
post '/questions/:question_id/answers' do
  if !current_user
    redirect '/login'
  end
  q_id = params[:question_id]
  Answer.create(content: params[:answer], user_id: session[:user_id], question_id: q_id )

  redirect "/questions/#{q_id}"
end


# vote routes for ajax
post '/questions/:id/votes' do
  question = Question.find_by_id params[:id]
  val = params[:vote].to_i
  vote = Vote.find_by(user: current_user, votable: question)
  if vote
    vote.value = vote.value == val ? 0 : val
    vote.save
  else
    vote = Vote.create(value: val, user: current_user, votable: question)
  end
  total = question.points
  value = vote.value
  { value: value, total: total }.to_json
end





