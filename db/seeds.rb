# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!("name" => "Carissa Ayunda Putri", "email" => "carissa@example.com", "password"=>"123456", "password_confirmation"=>"123456")
user2 = User.create!("name" => "Elyana", "email" => "elyana@example.com", "password"=>"123456", "password_confirmation"=>"123456")

question1 = Question.create!("text" => "Siapa presiden pertama negara Republik Indonesia?", "question_type" => "essay", "answer" => "Soekarno", "user" => user1)
question2 = Question.create!("text" => "Siapa presiden kedua negara Republik Indonesia?", "question_type" => "essay", "answer" => "Soeharto", "user" => user2)
question3 = Question.create!("text" => "Siapa presiden ketiga negara Republik Indonesia?", "question_type" => "essay", "answer" => "Habibie", "user" => user1)
question4 = Question.create!("text" => "Siapa presiden keempat negara Republik Indonesia?", "question_type" => "essay", "answer" => "Gus Dur", "user" => user2)
question5 = Question.create!("text" => "Siapa presiden kelima negara Republik Indonesia?", "question_type" => "essay", "answer" => "Megawati", "user" => user1)
question6 = Question.create!("text" => "Siapa presiden keenam negara Republik Indonesia?", "question_type" => "essay", "answer" => "Susilo Bambang Yudhoyono", "user" => user2)
question7 = Question.create!("text" => "Siapa presiden ketujuh negara Republik Indonesia?", "question_type" => "essay", "answer" => "Joko Widodo", "user" => user1)
question8 = Question.create!("text" => "2x3?", "question_type" => "essay", "answer" => "6", "user" => user2)
question9 = Question.create!("text" => "2x4?", "question_type" => "essay", "answer" => "8", "user" => user1)
question10 = Question.create!("text" => "2x5?", "question_type" => "essay", "answer" => "10", "user" => user2)
question11 = Question.create!("text" => "2x6?", "question_type" => "essay", "answer" => "12", "user" => user1)
question12 = Question.create!("text" => "2x7?", "question_type" => "essay", "answer" => "14", "user" => user2)
question13 = Question.create!("text" => "2x8?", "question_type" => "essay", "answer" => "16", "user" => user1)
question14 = Question.create!("text" => "2x9?", "question_type" => "essay", "answer" => "18", "user" => user2)
question15 = Question.create!("text" => "2x10?", "question_type" => "essay", "answer" => "20", "user" => user1)

user1.questions << question1
user1.questions << question3
user1.questions << question5
user1.questions << question7
user1.questions << question9
user1.questions << question11
user1.questions << question13
user1.questions << question15

user2.questions << question2
user2.questions << question4
user2.questions << question6
user2.questions << question8
user2.questions << question10
user2.questions << question12
user2.questions << question14