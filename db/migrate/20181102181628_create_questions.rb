class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
    	t.string :text
    	t.string :answer
    	t.string :question_type
    	t.string :answer_option_a
      t.string :answer_option_b
      t.string :answer_option_c
      t.string :answer_option_d
    	t.integer :user_id

      t.timestamps
    end
  end

  def down
  	drop_table :questions
  end
end
