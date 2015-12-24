class AddQuestionOneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_one, :text
  end
end
