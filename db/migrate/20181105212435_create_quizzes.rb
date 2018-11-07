class CreateQuizzes < ActiveRecord::Migration[5.0]
  def up
    create_table :quizzes do |t|
      t.string :email
      t.datetime :start_time
      # t.integer :number_of_questions
      t.float :score
      t.datetime :submit_time

      t.timestamps
    end
  end

  def down
    drop_table :quizzes
  end
end
