User.destroy_all
Question.destroy_all
Answer.destroy_all

User.create(username: 'cj', password: 'test')
User.create(username: 'Sarah')
User.create(username: 'Sean')

Question.create(title: 'how old is shaq?', content: 'how old is he?', user_id: 1)
Question.create(title: 'Where was Shaq born?', content: "I can't find a straight answer, where exactly was Shaq born?", user_id: 2)
Question.create(title: 'What team did Shaq play for?', content: 'I thought he played for the Lakers, but did he play for another team?', user_id: 3)
Question.create(title: "Where did Shaq go to school?", content: "Does anyone know?", user_id: 1)
Question.create(title: "What was Shaq's best movie?", content: "Does anyone know exactly how tall Shaq is??", user_id: 2)
Question.create(title: "Rap Album?", content: 'Does anyone remember the name of the shaq music album?', user_id: 3)

Answer.create(question_id: 1, user_id: 1, content: "He was born March 6th 1972, he is currently 34 years old")
Answer.create(question_id: 1, user_id: 2, content: "@CJ, If he was born in 1972, he would be right now. ")
Answer.create(question_id: 2, user_id: 2, content: "He was born in Newark New Jersey")
Answer.create(question_id: 3, user_id: 3, content: "He played for the magic, the lakers, the heat, the suns, cavs, and the celtics.")
Answer.create(question_id: 4, user_id: 1, content: "After graduating from high school, O'Neal studied business at Louisiana State University. He had first met Dale Brown, LSU's men's basketball coach, years earlier in Europe.")
Answer.create(question_id: 5, user_id: 2, content: "Starting with Blue Chips and Kazaam, O'Neal appeared in movies that were panned by some critics.")
Answer.create(question_id: 6, user_id: 3, content: "Beginning in 1993 O'Neal began to compose rap music. He released five studio albums and 1 compilation album.")
Answer.create(question_id: 1, user_id: 1, content: "@Sarah, sorry, I got the math wrong...")
Answer.create(question_id: 1, user_id: 3, content: "@CJ and @sarah... althat matters is that we all love Shaq...")
