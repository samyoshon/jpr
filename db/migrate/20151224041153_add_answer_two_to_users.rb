class AddAnswerTwoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_two, :text
  end
end
