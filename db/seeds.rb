User.destroy_all
Question.destroy_all

cj = User.create(username: 'cj', password: 'test')
Question.create(title: 'how old is shaq?', content: 'how old is he?', user: cj)
