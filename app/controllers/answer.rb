# vote handling
get "/answer/:id/votes/up" do
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

get "/answer/:id/votes/down" do
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
