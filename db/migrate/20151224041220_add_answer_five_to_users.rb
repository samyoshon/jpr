class AddAnswerFiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :answer_five, :text
  end
end
