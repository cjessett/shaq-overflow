# vote handling
get "/answers/:id/votes/up" do
  answer = Answer.find_by_id params[:id]
  if current_user
    val = 1
    vote = answer.votes.find_by(user: current_user)
    if vote
      vote.value == val ? vote.value = 0 : vote.value = val
      vote.save
    else
      Vote.create(value: val, user: current_user, votable: answer)
    end
    redirect request.referrer
  else
    redirect '/login'
  end
end

get "/answers/:id/votes/down" do
  answer = Answer.find_by_id params[:id]
  if current_user
    val = -1
    vote = answer.votes.find_by(user: current_user)
    if vote
      vote.value == val ? vote.value = 0 : vote.value = val
      vote.save
    else
      Vote.create(value: val, user: current_user, votable: answer)
    end
    redirect request.referrer
  else
    redirect '/login'
  end
end



# selects the favorite answer for a user question
get '/questions/:question_id/answers/:answer_id/favorite' do
  @answer = Answer.find(params[:answer_id])
  @question = Question.find(params[:question_id])
  @question.answers.each do |answer|
    answer.favorite = false
    answer.save
  end

  @answer.favorite = true
  @answer.save
  redirect "questions/#{@question.id}"
end
