class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
    	t.string :email
    	# t.integer :number_of_questions
    	t.float :score
    	t.date :take_date

      t.timestamps
    end
  end
end
