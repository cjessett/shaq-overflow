User.destroy_all
Question.destroy_all

cj = User.create(username: 'cj', password: 'test')
q = Question.create(title: 'how old is shaq?', content: 'how old is he?', user: cj)

19.times {
  vote = vote.new(value: 1)
  vote.update(votable: q)
}

