helpers do
  def current_user
    User.find_by_id session[:user_id]
  end

  def up_active?(object_type)
    if current_user.votes.find_or_initialize_by(votable: object_type).value == 1
      return "active"
    end
  end

  def down_active?(object_type)
    if current_user.votes.find_or_initialize_by(votable: object_type).value == -1
      return "active"
    end
  end

  def appropriate_user(id)
    if current_user.id == id.to_i
      "you have"
    else
      User.find_by_id(id).username + " has"
    end
  end

  def user_pronoun(id)
    if current_user.id == id.to_i
      "your"
    else
      User.find_by_id(id).username + "'s"
    end
  end

  def profile_header(id)
    if current_user.id == id.to_i
      "Welcome #{current_user.name}"
    else
      User.find_by_id(id).username + "'s profile"
    end
  end

end



