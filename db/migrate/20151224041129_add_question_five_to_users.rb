class AddQuestionFiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_five, :text
  end
end
