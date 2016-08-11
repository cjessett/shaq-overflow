get '/questions' do
  @questions = Question.all
  erb :index
end

post '/questions' do
  Question.create!(title: params[:title], content: params[:question], user_id: session[:user_id])
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
  @answers = @question.answers

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


# vote handling
get "/questions/:id/votes/up" do
  q = Question.find_by_id params[:id]
  if current_user
    Vote.create(value: 1, votable: q, user: current_user)
    redirect request.referrer
  else
    redirect '/login'
  end
end

get "/questions/:id/votes/down" do
  if current_user
      Vote.create(value: -1, votable: Question.find(params[:id]), user: current_user)
      redirect request.referrer
  else
    redirect '/login'
  end
end


# Vote handler pseudo

# Find question --> q
# get val ( val from view)

# vote = q.votes.find_by(user: current_user)
# if vote
  # vote.value == val ? vote.value = 0 : vote.value = val
# else
  # create new vote with value: val
# end





