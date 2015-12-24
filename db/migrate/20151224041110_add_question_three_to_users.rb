class AddQuestionThreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :question_three, :text
  end
end
