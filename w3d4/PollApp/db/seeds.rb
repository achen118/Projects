User.delete_all
Poll.delete_all
Question.delete_all
AnswerChoice.delete_all
Response.delete_all

user1 = User.create!(user_name: "Alice")
user2 = User.create!(user_name: "David")
user3 = User.create!(user_name: "Everyone Else")

poll1 = Poll.create!(author_id: user1.id, title: "President")
poll2 = Poll.create!(author_id: user2.id, title: "App Academy")
poll3 = Poll.create!(author_id: user3.id, title: "Peaches")

q1 = Question.create!(poll_id: poll1.id, question_body: "Who should be our class president?")
q2 = Question.create!(poll_id: poll2.id, question_body: "Who will be the first to get a job?")
q3 = Question.create!(poll_id: poll3.id, question_body: "Where can I find the best peaches?")

ac1 = AnswerChoice.create!(question_id: q1.id, answer_body: "David")
ac2 = AnswerChoice.create!(question_id: q1.id, answer_body: "Alice")
ac3 = AnswerChoice.create!(question_id: q1.id, answer_body: "Somebody else")

ac4 = AnswerChoice.create!(question_id: q2.id, answer_body: "Better David")
ac5 = AnswerChoice.create!(question_id: q2.id, answer_body: "Better Alice")
ac6 = AnswerChoice.create!(question_id: q2.id, answer_body: "Atom")

ac7 = AnswerChoice.create!(question_id: q3.id, answer_body: "San Francisco")
ac8 = AnswerChoice.create!(question_id: q3.id, answer_body: "Ferry Building")
ac9 = AnswerChoice.create!(question_id: q3.id, answer_body: "Farm")

r1 = Response.create!(user_id: user2.id, answer_choice_id: ac2.id)
r2 = Response.create!(user_id: user1.id, answer_choice_id: ac9.id)
r4 = Response.create!(user_id: user3.id, answer_choice_id: ac3.id)
