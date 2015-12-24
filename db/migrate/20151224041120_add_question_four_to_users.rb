class AddQuestionFourToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_four, :text
  end
end
