get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    redirect '/login'
  end
end

post '/questions' do
  params['question']['user'] = current_user
  Question.create(params[:question])
  redirect to '/questions'
end

get '/questions/:id' do
  @question = Question.find_by_id(params[:id])
  @answers = @question.answers.order(favorite: :desc)
  erb :'/questions/show'
end


# vote route for ajax
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





