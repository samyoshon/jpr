class AddQuestionTwoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_two, :text
  end
end
